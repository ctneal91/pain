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
    @prescription = @current_patient.prescriptions.find params[:prescription_id]
    @dose = Dose.new params.require(:dose).permit(:amount_of_pills_taken, :pain_scale)
    if @dose.save
      @prescription.doses << @dose
        # pushes to .doses and saves to db
        # solidifies the relationship btw the 2 model instances
      redirect_to prescription_path(id: @prescription.id)
    else
      render :new
    end
  end
end
