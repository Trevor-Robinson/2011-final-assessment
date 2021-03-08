class SurgeryController < ApplicationController
  def show
    @surgery = Surgery.find(params[:id])
    @doctors = @surgery.doctors.experience_order
  end
end
