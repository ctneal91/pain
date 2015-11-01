class DosesController < ApplicationController
  before_action :authenticate_user!

  def new
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
