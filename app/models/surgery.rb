class Surgery < ApplicationRecord
  validates :title, allow_blank: false, presence: true
  validates :day_of_week, allow_blank: false, presence: true
  validates :operating_room_number, allow_blank: false, presence: true
  has_many :doctor_surgeries
  has_many :doctors, through: :doctor_surgeries

  def average_years
    doctors.average(:years_practiced).round
  end

  def self.average_years_order
    joins(:doctors)
    .group('surgeries.id')
    .select('surgeries.*, average(doctors.years_practiced)as avg_years')
    .order('avg_years DESC')
  end
end
