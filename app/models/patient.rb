class Patient < ApplicationRecord
  belongs_to :user
	has_many :day_statistics
  validates :name, presence: { message: "Укажите инициалы пациента" }

  validates :start_time_antibacterial_therapy,
            :volume_start_infusion,
            :ivl_time, 
            :death_count_days,
            :reanimation_count_days,
            :hospital_count_days, numericality: { only_integer: true, greater_than_or_equal_to: 0, message: " должно быть больше или равно 0" }

end
