class ExpertsController < ApplicationController

  before_action :logged_in_expert, only: [:edit, :update]
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
      redirect_to dashboard_path(@expert)
    else
      render 'new'
    end
  end

  def show
    @expert = Expert.find(params[:id])
    @expert_unreserved_available_times = @expert.available_times.where(reserved: false)
    @user = current_user
    @transaction = Transaction.new
  end

  def dashboard
    @expert = current_expert
    @available_times = @expert.available_times    
    @transactions = @expert.transactions
    @pending_transactions = @transactions.where(status: "pending")    
    @confirmed_transactions = @transactions.where(status: "ok")
  end

  def update
    @user = User.find_by[:user_id]
    @transaction = Transaction.find_by(id)
    if @transaction.update_attributes(:status, "ok")
      redirect_to dashboard_path(current_expert)
    end
  end 

  private

    def expert_params
      params.require(:expert).permit(:firstname, :lastname, :email, :experience, :location, :picture, :password,
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
