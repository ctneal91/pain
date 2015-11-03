class DosesController < ApplicationController
  before_action :authenticate_user!

  def new
    if @current_patient
      @prescription = @current_patient.prescriptions.find params[:prescription_id]
    elsif @current_doctor
      @prescription = @current_doctor.prescriptions.find params[:prescription_id]
    end

    @dose = Dose.new
  end

  def create
    @dose = Dose.new params.require(:dose).permit(:amount_of_pills_taken, :pain_scale)
    if @dose.save
      redirect_to root_path
    else
      render :new
    end
  end
end
