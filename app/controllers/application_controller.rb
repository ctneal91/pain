class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action do
    @current_patient = Patient.find_by id: session[:patient_id]
    @current_doctor = Doctor.find_by id: session[:doctor_id]
  end

  def authenticate_user!
    if (@current_patient.blank?) && (@current_doctor.blank?)
      redirect_to overall_sign_in_path
    end
  end
  
end
