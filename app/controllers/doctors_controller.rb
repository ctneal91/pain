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

  def patient
    @patient = @current_doctor.patients.find params[:patient_id]
    @prescriptions = @patient.prescriptions
  end

  def prescription
    @patient = @current_doctor.patients.find params[:patient_id]
    @prescription = @patient.prescriptions.find params[:prescription_id]
  end

  def doctor_params
    params.require(:doctor).permit(:first_name, :last_name, :email, :password, :password_confirmation, :speciality)
  end
end
