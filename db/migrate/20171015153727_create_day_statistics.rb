class CreateDayStatistics < ActiveRecord::Migration[5.1]
  def change
    create_table :day_statistics do |t|
      #Фракция выброса левого желудочка %
      t.integer :left_ventrical_function
   
    #Синдром системного воспалительного ответа
      
      #Частота сердечных сокращений
      t.integer :heart_rate
      #Частота дыхания
      t.integer :breath_rate
      #Число лейкоцитов
      t.decimal :leucocytes_count
      #Систолическое артериальное давление
      t.integer :systalic_ad
      
    #Шкала denver
      
      #Респираторный индекс Pa02(mm Hg)/FiO2.
      t.integer :denver_pao2_fio2
      #Креатинин мг/дл
      t.decimal :denver_creatinine
      #Билирубин мг/дл
      t.decimal :bilirubin
      
      #Кардиотоническая поддержка мкг/кг/мин
      #Допамин 
      t.integer :dopamine
      #Добутамин
      t.integer :dobutamine
      #Адреналин
      t.integer :epinephrine
      #Норадреналин
      t.integer :norepinephrine
    
    #Шкала PELOD2
      
      #Оценка по шкале Glasgow coma
      t.integer :glasgow_coma
      #Фотореакция зрачков
        #Реагирует
        #Не реагирует (более 3 мм)
      t.boolean :is_pupillary_reaction
      #Уровень лактата ммоль/л
      t.decimal :lactatemia
      #Среднее артериальное давление
      t.integer :pelod_mean_ad
      #Креатинин ммоль/л
      t.integer :pelod_creatinine
      #Респираторный индекс Pa02(mm Hg)/FiO2. PaO2 - артериальная кровь
      t.integer :pelod_pao2_fio2
      #Парциальное напряжение C02 mmHg.
      t.integer :paco2
      #Инвазивная вентиляция (Да или нет)
      t.boolean :is_invasive_ventilation, default: false
      #Число тромбоцитов
      t.integer :trombocit_count

    #Шкала pediatric SOFA
     
      #SpO2/FiO2
      t.integer :spo2_fio2
      
    
      t.references :patient, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
