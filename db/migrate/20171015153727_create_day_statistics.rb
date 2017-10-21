class CreateDayStatistics < ActiveRecord::Migration[5.1]
  def change
    create_table :day_statistics do |t|
      #Фракция выброса левого желудочка %
      t.integer :left_ventrical_function, default: 0
   
    #Синдром системного воспалительного ответа
      
      #Частота сердечных сокращений
      t.integer :heart_rate, default: 0
      #Частота дыхания
      t.integer :breath_rate, default: 0
      #Число лейкоцитов
      t.decimal :leucocytes_count, default: 0.0
      #Систолическое артериальное давление
      t.integer :systalic_ad, default: 0
      
    #Шкала denver
      
      #Респираторный индекс Pa02(mm Hg)/FiO2.
      t.integer :denver_pao2_fio2, default: 0
      #Креатинин мг/дл
      t.decimal :denver_creatinine, default: 0.0
      #Билирубин мг/дл
      t.decimal :bilirubin, default: 0.0
      
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
      t.integer :glasgow_coma, default: 0
      #Фотореакция зрачков
        #Реагирует
        #Не реагирует (более 3 мм)
      t.boolean :is_pupillary_reaction, default: true
      #Уровень лактата ммоль/л
      t.decimal :lactatemia, default: 0.0
      #Среднее артериальное давление
      t.integer :pelod_mean_ad, default: 0
      #Креатинин ммоль/л
      t.integer :pelod_creatinine, default: 0
      #Респираторный индекс Pa02(mm Hg)/FiO2. PaO2 - артериальная кровь
      t.integer :pelod_pao2_fio2, default: 0
      #Парциальное напряжение C02 mmHg.
      t.integer :paco2, default: 0
      #Инвазивная вентиляция (Да или нет)
      t.boolean :is_invasive_ventilation, default: false
      #Число тромбоцитов
      t.integer :trombocit_count, default: 0

    #Шкала pediatric SOFA
     
      #SpO2/FiO2
      t.integer :spo2_fio2, default: 0
      
    
      t.references :patient, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
