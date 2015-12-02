class AvailableTimesController < ApplicationController

  def new
    @available_time = AvailableTime.new
    respond_to do |format|
      format.html
      format.js
    end    
  end  

  def create
    @available_time = AvailableTime.new(time_params)
    @available_time.expert = current_expert

    if @available_time.save
      flash[:success] = "You added an available time successfully!"
      redirect_to dashboard_path(current_expert)
    else
      render 'dashboard'
    end
  end

  private

    def time_params
      params.require(:available_time).permit(:date, :start_time, :end_time)
    end  

end
