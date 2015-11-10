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

  def new_prescription
    @patient = @current_doctor.patients.find params[:patient_id]
    @prescription = Prescription.new
  end

  def create_prescription
    @patient = Patient.find params[:patient_id]
    @prescription = Prescription.new(prescription_params)
    if @prescription.save
      @patient.prescriptions << @prescription
      @current_doctor.prescriptions << @prescription
      redirect_to doctor_view_patient_path(id: @current_doctor.id, patient_id: @patient.id)
    else
      render :new_prescription
    end
  end

  def doctor_params
    params.require(:doctor).permit(:first_name, :last_name, :email, :password, :password_confirmation, :speciality)
  end

  def prescription_params
    params.require(:prescription).permit(:initial_amount_of_pills, :length_of_prescription, :max_dose_amount, :purpose, :instructions, :doses_per_day, :drug_name)
  end

  def all_patients
    @patients = Patient.all
  end

  def new_patient_prescription
    @patient = Patient.find params[:patient_id]
    @prescription = Prescription.new
  end
end
