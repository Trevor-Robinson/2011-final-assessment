class SurgeryController < ApplicationController
def index
  @surgeries = Surgery.all
end

  def show
    @surgery = Surgery.find(params[:id])
    @doctors = @surgery.doctors.experience_order
  end
end
