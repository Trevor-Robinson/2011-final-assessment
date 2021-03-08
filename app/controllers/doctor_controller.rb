class DoctorController < ApplicationController
  def index
    @doctors = Doctor.experience_order
  end
end
