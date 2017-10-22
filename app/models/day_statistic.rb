class DayStatistic < ApplicationRecord
  belongs_to :patient
  belongs_to :user
  validates :left_ventrical_function,
            :heart_rate,
            :breath_rate,
            :systalic_ad,
            :denver_pao2_fio2,
            :glasgow_coma,
            :pelod_mean_ad,
            :pelod_creatinine,
            :pelod_pao2_fio2,
            :paco2,
            :trombocit_count ,
            :spo2_fio2, numericality: { only_integer: true, greater_than_or_equal_to: 0, message: "Цифровые поля должны быть больше или равны 0" }
  
  validates :leucocytes_count,
            :denver_creatinine,
            :bilirubin,
            :lactatemia, numericality: { only_decimal: true, greater_than_or_equal_to: 0, message: "Цифровые поля должны быть больше или равны 0" }


end