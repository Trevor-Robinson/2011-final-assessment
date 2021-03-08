class Surgery < ApplicationRecord
  validates :title, allow_blank: false, presence: true
  validates :day_of_week, allow_blank: false, presence: true
  validates :operating_room_number, allow_blank: false, presence: true
  has_many :doctor_surgeries
  has_many :doctors, through: :doctor_surgeries

  def average_years
  end
end
