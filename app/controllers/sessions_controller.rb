class SessionsController < ApplicationController
  def patient_or_doctor
  end

  def newpatient
  end

  def create_patient
    @email = params[:email]
    @password = params[:email]

    patient = Patient.find_by email: @email

    if patient && patient.authenticate(@password)
      session[:patient_id] = patient.id
      redirect_to root_path
    else
      flash.now[:alert] = 'Something is wrong with your email or password'
      render :newpatient
    end
  end

  def newdoctor
  end

  def create_doctor
    @email = params[:email]
    @password = params[:password]

    doctor = Doctor.find_by email: @email

    if doctor && doctor.authenticate(@password)
      session[:doctor_id] = doctor.id
      redirect_to root_path
    else
      flash.now[:alert] = "Something is wrong with your email or password"
      render :newdoctor
    end
  end
end
