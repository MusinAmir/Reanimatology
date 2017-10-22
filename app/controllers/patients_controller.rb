class PatientsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_patient, only: [:show, :edit, :update, :destroy, :add_information]
  before_action :set_age_options, :set_days_strings


  # GET /patients
  # GET /patients.json
  def index
    @patients = current_user.patients
  end

  # GET /patients/1
  # GET /patients/1.json
  def show

  end

  # GET /patients/new
  def new
    @patient = Patient.new
  end

  # GET /patients/1/edit
  def edit
  end

  # POST /patients
  # POST /patients.json
  def create
    @patient = Patient.new(patient_params)
    @patient.user = current_user
    respond_to do |format|
      if @patient.save
        format.html { redirect_to @patient, notice: 'Новый пациент добавлен.' }
        format.json { render :show, status: :created, location: @patient }
      else
        format.html { render :new }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /patients/1
  # PATCH/PUT /patients/1.json
  def update
    respond_to do |format|
      if @patient.update(patient_params)
        format.html { redirect_to @patient, notice: "'Данные пациента обновлены.'" }
        format.json { render :show, status: :ok, location: @patient }
      else 
        format.html { render :edit}
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  def add_information
  end
  # DELETE /patients/1s
  # DELETE /patients/1.json
  def destroy
    @day_statistics = @patient.day_statistics.all
    @day_statistics.delete_all
    @patient.destroy
    respond_to do |format|
      format.html { redirect_to patients_url, notice: 'Данные пациента удалены.' }
      format.json { head :no_content }
    end
  end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_patient
        if Patient.exists?(id: params[:id], user_id: current_user.id)
          @patient = Patient.find(params[:id])
        else
          redirect_to root_path
        end
      end

    # Never trust parameters from the scary internet, only allow the white list through.
    def patient_params
      params.require(:patient).permit(:name, :age_type, :clinic_diagnosis,:intrance_date,
        :research_date, :is_infection, :infection_localization, :identified_pathogen,
        :pathogen_date, :antibacterial_therapy, :start_time_antibacterial_therapy,
        :volume_start_infusion, :start_infusion_solution, :is_ivl, :ivl_time, :is_sepsis,
        :sespsis_date, :is_renal_therapy, :renal_therapy, :is_operation, :final_diagnosis, :is_alive, :death_count_days, :reanimation_count_days, :hospital_count_days)
    end      
    def set_age_options
      @age = {'0-6 мес'=>1, '6 мес-1 год'=> 2, '1-3 года' => 3, '4-6 лет' => 4, '7-10 лет'=> 5, '11 и старше'=> 6}   
    end
    
    def set_days_strings
      @day_strings = {0 => "Первый день", 1 => "Второй день", 2 => "Третий день", 3 => "Четвертый день", 4 => "Пятый день"}
    end
end
