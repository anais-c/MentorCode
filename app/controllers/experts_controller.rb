class ExpertsController < ApplicationController

  before_action :logged_in_expert, only: [:edit, :update, :dashboard]
  before_action :correct_expert,   only: [:edit, :update]

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
    @user = current_user
    @transaction = Transaction.new
  end

  def dashboard
    #binding.pry

    #@expert = Expert.find(params[:id])

    @expert = current_expert
    @transactions = @expert.transactions
    @available_times = @expert.available_times

    #@transactions = @available_time.transactions
    
  end

  def update
    @user = User.find_by[:user_id]
    @transaction = Transaction.find_by(id: params[:id])
    if @transaction.update_attributes(:status, "ok")
      redirect_to dashboard_path(current_expert)
    else
    end
  end 

  private

    def expert_params
      params.require(:expert).permit(:firstname, :lastname, :email, :experience, :location, :password,
                                   :password_confirmation)
    end

    def logged_in_expert
      unless logged_in_expert? 
        store_location
        flash[:danger] = "Please log in."
        redirect_to experts_login_path
      end
    end

    def correct_expert
      @expert = Expert.find(params[:id])
      redirect_to(root_url) unless @expert == corrent_expert
    end

end
