class VisitsController < ApplicationController
  before_action :authenticate_user!

  def new
    @visit = Visit.new
  end

  def create
    @visit = Visit.new params.require(:visit).permit(:date, :time, :reason)
  end
end
