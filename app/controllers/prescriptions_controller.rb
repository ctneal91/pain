class PrescriptionsController < ApplicationController
  before_action :authenticate_user!

  def index
    if @current_patient
      @prescriptions = Prescription.where patient_id: @current_patient.id
    elsif @current_doctor
      redirect_to doctor_view_patients_path(id: @current_doctor.id)
    end
  end

  def show
    if @current_patient
      @prescription = @current_patient.prescriptions.find params[:id]
    elsif @current_doctor
      @prescription = @current_doctor.prescriptions.find params[:id]
    end

    @doses = @prescription.doses
  end

  def new
    @patient = @current_doctor.patients.find params[:patient_id]
    @prescription = Prescription.new
  end

  def create
    @patient = @current_doctor.patients.find params[:patient_id]
    @prescription = Prescription.new(prescription_params)
    if @prescription.save
      @patient.prescriptions << @prescription
      @current_doctor.prescriptions << @prescription
      redirect_to doctor_view_patient_path(id: @current_doctor.id, patient_id: @patient.id)
    else
      render :new_prescription
    end
  end
end
