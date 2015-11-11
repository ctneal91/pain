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

    @doses = @prescription.doses.order("created_at desc")
  end
end
