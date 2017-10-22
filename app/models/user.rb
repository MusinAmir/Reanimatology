class User < ApplicationRecord
  has_many :patients
  has_many :day_statistics
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :name, presence: { message: "Укажите ваши инициалы" }
  validates :irk, presence: { message: "Укажите ИРК" } 
end
