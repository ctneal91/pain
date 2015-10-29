class PatientsController < ApplicationController
  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)
    if @patient.save
      session[:patient_id] = @patient.id
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def patient_params
    params.require(:patient).permit(:first_name, :last_name, :email, :password, :password_confirmation, :insurer)
  end
end
