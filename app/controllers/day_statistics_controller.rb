class DayStatisticsController < ApplicationController
	before_action :set_patient, :set_dosage_definitions
	before_action :set_day_statistic, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
	
  def index
		@day_statistics = @patient.day_statistics.all
	end

	def show
	end

	def new
		@day_statistic = @patient.day_statistics.new
	end
	
	def edit
	end

	def create
    if @patient.day_statistics.size > 5
      redirect_to @patient
    else 
      @day_statistic = @patient.day_statistics.create(day_statistic_params)
      @day_statistic.user = current_user
      respond_to do |format|
    	  if @day_statistic.save
    		  format.html {redirect_to @patient, notice: 'Данные сохранены.'}
    		  format.json {render :show, status: :created, location: @patient}
    	  else
    		  format.html { render :new}
    		  format.json {render json: @day_statistic.errors, status: :unprocessable_entity }
    	 end
      end
    end
  end

  def update
  	respond_to do |format|
  		if @day_statistic.update(day_statistic_params)
    		format.html {redirect_to patient_day_statistic_path(@patient, @day_statistic), notice: 'Данные обновлены.'}
    		format.json {render :show, status: :ok, location: @day_statistic}
    	else
    		format.html { render :edit}
    		format.json {render json: @day_statistic.errors, status: :unprocessable_entity }
    	end
    end
  end
  
  def destroy 
  	@day_statistic.destroy
  	respond_to do |format|
    	format.html {redirect_to @patient, notice: 'Данные удалены.'}
    	format.json {head :no_content}
    end
  end

  private

  	def set_day_statistic
  		@day_statistic = DayStatistic.find(params[:id])
  	end

  	def set_patient
  		@patient = Patient.find(params[:patient_id])
  	end
      
    def day_statistic_params
      params.require(:day_statistic).permit(:patient_id, :left_ventrical_function,
        :heart_rate, :breath_rate, :leucocytes_count, :systalic_ad, :denver_pao2_fio2, :denver_creatinine,
        :bilirubin, :dopamine, :dobutamine, :epinephrine, :norepinephrine, :glasgow_coma,
        :is_pupillary_reaction, :lactatemia, :pelod_mean_ad, :pelod_creatinine, :pelod_pao2_fio2,
        :paco2, :is_invasive_ventilation, :trombocit_count, :spo2_fio2)
    end
    
    def set_dosage_definitions
      @dopamine_dosage = {'< 6'=> 0, '[6, 15]' => 1, '> 15' => 2 }
      @dobutamine_dosage = {'< 6'=> 0, '[6, 15]' => 1, '> 15' => 2 }
      @epinephrine_dosage = {'< .06'=> 0, '[.06, .25]' => 1, '> .25' => 2 }
      @norepinephrine_dosage = {'< .11'=> 0, '[.11, .50]' => 1, '> .50' => 2 }
    end      
end
