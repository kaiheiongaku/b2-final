class SurgeriesController < ApplicationController

  def index
    @surgeries = Surgery.all
  end

  def show
    @surgery = Surgery.find(params[:id])
    @last_doctor = DoctorSurgery.first.doctor
    binding.pry
  end

  def create
    @surgery = Surgery.find(params[:surgery_id])
    @doctor = Doctor.create(doctor_params)
    hash = {doctor_id: @doctor.id, surgery_id: params[:surgery_id]}
    @doctory_surgery = DoctorSurgery.create(hash)
    redirect_to "/surgeries/#{@surgery.id}"
  end

  private
  def doctor_params
    params.permit(:name)
  end
end
