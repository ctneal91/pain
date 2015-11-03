class DoctorsController < ApplicationController
  def new
    @doctor = Doctor.new
  end

  def create
    @doctor = Doctor.new(doctor_params)
    if @doctor.save
      session[:doctor_id] = @doctor.id
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def patients
    @patients = @current_doctor.patients
  end

  def doctor_params
    params.require(:doctor).permit(:first_name, :last_name, :email, :password, :password_confirmation, :speciality)
  end
end
