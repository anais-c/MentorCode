class AvailableTimesController < ApplicationController

  def new 
    @available_time = AvailableTime.new
    render :new
  end  

  def show
  end

  def create
    @available_time = AvailableTime.new(time_params)
    @available_time.expert = current_expert

    respond_to do |format|
      if @available_time.save
        format.html {
            redirect_to dashboard_path(current_expert), :notice => "Available time created!"}
        format.js { render :new unless @available_time.save }
      end
    end
  end

  def destroy
    @available_time = AvailableTime.destroy(params[:id])
    respond_to do |format|
      format.html { redirect_to dashboard_path(current_expert) }
      format.js
    end
  end 

  private

    def time_params
      params.require(:available_time).permit(:date, :start_time, :end_time)
    end  

end
