class ExpertsController < ApplicationController
  def index
    @experts = Expert.all
  end

  def new
    @expert = Expert.new
  end

  def create
    @expert = Expert.new(expert_params)
    if @expert.save
      log_in_expert @expert
      flash[:success] = "Welcome to our app"
      redirect_to expert_path(@expert)
    else
      render 'new'
    end
  end

  def show
    @expert = Expert.find(params[:id])
  end

  def dashboard
    @expert = Expert.find(params[:id])
  end

  private

    def expert_params
      params.require(:expert).permit(:firstname, :lastname, :email, :experience, :location, :password,
                                   :password_confirmation)
    end

end
