class Doctor < ApplicationRecord
  validates :name, allow_blank: false, presence: true
  validates :years_practiced, allow_blank: false, presence: true
  validates :university, allow_blank: false, presence: true
  has_many :doctor_surgeries
  has_many :surgeries, through: :doctor_surgeries
end
