ActiveAdmin.register DayStatistic do
  menu label: "Добавленные дни", priority: 4

  permit_params :user_id, :patient_id, :left_ventrical_function,
        :heart_rate, :breath_rate, :leucocytes_count, :systalic_ad, :denver_pao2_fio2, :denver_creatinine,
        :bilirubin, :dopamine, :dobutamine, :epinephrine, :norepinephrine, :glasgow_coma,
        :is_pupillary_reaction, :lactatemia, :pelod_mean_ad, :pelod_creatinine, :pelod_pao2_fio2,
        :paco2, :is_invasive_ventilation, :trombocit_count, :spo2_fio2
  
  controller do
    actions :all, :except => [:new, :destroy]
  end
  
  dopamine_dosage = {'Не использовался'=> 0, '< 6'=> 1, '[6, 15]' => 2, '> 15' => 3 }
  dobutamine_dosage = {'Не использовался'=> 0, '< 6'=> 1, '[6, 15]' => 2, '> 15' => 3 }
  epinephrine_dosage = {'Не использовался'=> 0,'< 0.06'=> 1, '[0.06, 0.25]' => 2, '> 0.25' => 3 }
  norepinephrine_dosage = {'Не использовался'=> 0,'< 0.11'=> 1, '[0.11, 0.50]' => 2, '> 0.50' => 3 }
  
  index do
    selectable_column
    id_column
    column :user_id do |day_statistic|
      user = User.find(day_statistic.user_id)
      link_to user.name, admin_user_path(user)
    end
    column :patient_id do |day_statistic|
      patient = Patient.find(day_statistic.patient_id)
      link_to patient.name, admin_patient_path(patient)
    end
    column :left_ventrical_function 
    column :heart_rate 
    column :breath_rate
    column :leucocytes_count
    column :systalic_ad
    column :denver_pao2_fio2
    column :denver_creatinine
    column :bilirubin
    column :dopamine do |day_statistic|
        dopamine_dosage.key(day_statistic.dopamine).to_s
    end
    column :dobutamine do |day_statistic|
        dobutamine_dosage.key(day_statistic.dobutamine).to_s
    end
    column :epinephrine do |day_statistic|
        epinephrine_dosage.key(day_statistic.epinephrine).to_s
    end
    column :norepinephrine do |day_statistic|
        norepinephrine_dosage.key(day_statistic.norepinephrine).to_s
    end
    column :glasgow_coma
    column :is_pupillary_reaction do |day_statistic|
      day_statistic.is_pupillary_reaction ? "Сохранена" : "Расширена > 3 мм"
    end
    column :lactatemia
    column :pelod_mean_ad
    column :pelod_creatinine
    column :pelod_pao2_fio2
    column :paco2
    column :is_invasive_ventilation
    column :trombocit_count
    column :spo2_fio2
    actions
  end
  
  filter :patient_id, as: :select, collection: Patient.all
  filter :created_at
  
  show do
    attributes_table do
      row :user_id do |day_statistic|
        user = User.find(day_statistic.user_id)
        link_to user.name, admin_user_path(user)
      end
      row :patient_id do |day_statistic|
        patient = Patient.find(day_statistic.patient_id)
        link_to patient.name, admin_patient_path(patient)
      end
      row :left_ventrical_function 
      row :heart_rate 
      row :breath_rate
      row :leucocytes_count
      row :systalic_ad
      row :denver_pao2_fio2
      row :denver_creatinine
      row :bilirubin
      row :dopamine do |day_statistic|
          dopamine_dosage.key(day_statistic.dopamine).to_s
      end
      row :dobutamine do |day_statistic|
          dobutamine_dosage.key(day_statistic.dobutamine).to_s
      end
      row :epinephrine do |day_statistic|
          epinephrine_dosage.key(day_statistic.epinephrine).to_s
      end
      row :norepinephrine do |day_statistic|
          norepinephrine_dosage.key(day_statistic.norepinephrine).to_s
      end
      row :glasgow_coma
      row :is_pupillary_reaction do |day_statistic|
        day_statistic.is_pupillary_reaction ? "Сохранена" : "Расширена > 3 мм"
      end
      row :lactatemia
      row :pelod_mean_ad
      row :pelod_creatinine
      row :pelod_pao2_fio2
      row :paco2
      row :is_invasive_ventilation
      row :trombocit_count
      row :spo2_fio2
  
    end
  end
end
