class PrescriptionsController < ApplicationController
  before_action :authenticate_user!

  def index
    if @current_patient
      @prescriptions = Prescription.where patient_id: @current_patient.id
    elsif @current_doctor
      @prescriptions = Prescription.where doctor_id: @current_doctor.id
    end
  end

  def show
  end
end
