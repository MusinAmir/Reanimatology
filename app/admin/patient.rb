ActiveAdmin.register Patient do
  menu label: "Пациенты", priority: 3

permit_params :user_id, :name, :age_type, {age: {}}, :clinic_diagnosis, :intrance_date,
        :research_date, :is_infection, :infection_localization, :identified_pathogen,
        :pathogen_date, :antibacterial_therapy, :start_time_antibacterial_therapy,
        :volume_start_infusion, :start_infusion_solution, :is_ivl, :ivl_time, :is_sepsis,
        :sespsis_date, :is_renal_therapy, :renal_therapy, :is_operation, :final_diagnosis, 
        :is_alive, :death_count_days, :reanimation_count_days, :hospital_count_days
  
  controller do
    actions :all, :except => [:destroy]
  end

  age = {'0-6 мес'=>1, '6 мес-1 год'=> 2, '1-3 года' => 3, '4-6 лет' => 4, '7-10 лет'=> 5, '11 и старше'=> 6}   
  day_strings = {0 => "Первый день", 1 => "Второй день", 2 => "Третий день", 3 => "Четвертый день", 4 => "Пятый день"}

  index do
    selectable_column
    id_column
    column :user_id do |patient|
      user = User.find(patient.user_id)
      link_to user.name, admin_user_path(user)
    end
    column :name
    
    column :age_type do |patient|
      age.key(patient.age_type).to_s
    end

    column :clinic_diagnosis
    column :final_diagnosis
    column :is_alive do |patient|
      patient.is_alive ? "Перевед из реанимации": "Умер"
    end
    actions
  end
    filter :user_id, as: :select, collection: User.all
    filter :age_type, :as => :select, :collection => age


  form do |f|
    f.inputs "Users" do 
      f.input :user_id, as: :select, collection: User.all
      f.input :name
      f.input :age_type, as: :select,  collection: age, include_blank: false
      f.input :clinic_diagnosis
      f.input :intrance_date
      f.input :research_date
      f.input :is_infection
      f.input :infection_localization
      f.input :identified_pathogen
      f.input :pathogen_date
      f.input :antibacterial_therapy
      f.input :start_time_antibacterial_therapy
      f.input :volume_start_infusion
      f.input :start_infusion_solution
      f.input :is_ivl
      f.input :ivl_time 
      f.input :is_sepsis
      f.input :sespsis_date
      f.input :is_renal_therapy
      f.input :renal_therapy
      f.input :is_operation
      f.input :final_diagnosis
      f.input :is_alive
      f.input :death_count_days
      f.input :reanimation_count_days
      f.input :hospital_count_days
    end
    f.actions 
  end


   show do
    panel patient.name do
      count = 0
      table_for(patient.day_statistics) do |t|
        if count <6
          t.column("Добавленные дни") {|item| link_to day_strings[count], admin_day_statistic_path(item)}
          count += 1
        end
      end
      attributes_table do
        row :user_id do |patient|
          user = User.find(patient.user_id)
          link_to user.name, admin_user_path(user)
        end
        row :name
        row :age_type do |patient|
          age.key(patient.age_type).to_s
        end
        row :clinic_diagnosis
        row :intrance_date
        row :research_date
        row :is_infection
        row :infection_localization
        row :identified_pathogen
        row :pathogen_date
        row :antibacterial_therapy
        row :start_time_antibacterial_therapy
        row :volume_start_infusion
        row :start_infusion_solution
        row :is_ivl
        row :ivl_time 
        row :is_sepsis
        row :sespsis_date
        row :is_renal_therapy
        row :renal_therapy
        row :is_operation
        row :final_diagnosis
        row :is_alive do |patient|
          patient.is_alive ? "Перевед из реанимации": "Умер"
        end
        row :death_count_days
        row :reanimation_count_days
        row :hospital_count_days 
      end
    end
  end
end
