class CreatePatients < ActiveRecord::Migration[5.1]
  def change
    create_table :patients do |t|
      t.string :name
      t.integer :age_type
      #Клинический диагноз
      t.text :clinic_diagnosis
      #Дата поступления
      t.date :intrance_date
      #Дата включения в исследование
      t.date :research_date
      #Наличие инфекционного очага
      t.boolean :is_infection, default: false
      #Локализация очага инфекции
      t.string :infection_localization
      #Выявленный возбудитель
      t.string :identified_pathogen
      #Дата выявления возбудителя
      t.date :pathogen_date
      #Антибактериальная терапия, препарат, доза мг/кг, кратность введения
      t.text :antibacterial_therapy
      #Время, прошедшее до начала антибактериальной терапии (ч)
      t.integer :start_time_antibacterial_therapy, default: 0
      #Объем стартовой инфузионной терапии (мл/кг/ч)
      t.integer :volume_start_infusion, default: 0
      #Стартовый инфузионный раствор
      t.string :start_infusion_solution
      #Искусственная вентиляция легких
      t.boolean :is_ivl, default: false
      #Длительность искусственной вентиляции легких (ч)
      t.integer :ivl_time, default: 0
      #Установлен ли сепсис
      t.boolean :is_sepsis, default: false
      #Дата установки сепсиса
      t.date :sespsis_date
      #Использовалась ли заместительная почечная терапия
      t.boolean :is_renal_therapy, default: false
      #Метод заместитетльной почечной терапии
      t.string :renal_therapy
      #Было ли оперативное вмешательство
      t.boolean :is_operation, default: false
      
      #Заключительный диагноз
      t.text :final_diagnosis
      
      #Исход заболевания:
        #Переведен из реанимационного отделения
        #Летальный исход
      t.boolean :is_alive, default: true
      #На какие сутки наступил летальный исход
      t.integer :death_count_days
      #Длительность пребывания в реанимации
      t.integer :reanimation_count_days
      #Длительность пребывания в стационаре
      t.integer :hospital_count_days
      
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
