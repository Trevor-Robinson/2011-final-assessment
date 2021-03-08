class DoctorSurgeryController < ApplicationController
  def create
    doctor = Doctor.find_by(name: params[:doctor])
    DoctorSurgery.create!(doctor_id: doctor.id, surgery_id: params[:format])
    redirect_to surgery_path(params[:format])
  end
end
