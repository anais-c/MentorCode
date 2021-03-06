class UsersController < ApplicationController

  before_action :logged_in_user, only: [:edit, :update]
  before_action :correct_user,   only: [:edit, :update]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @transactions = @user.transactions.order(:date)
    #@ordered_transactions = @transactions.sort_by { |t| AvailableTime.find(t.available_time_id).date }
    #@ordered_transactions = @transactions.sort_by { |t| t.updated_at }
    @pending_transactions = @transactions.where(status: "pending") 
    @confirmed_transactions = @transactions.where(status: "ok").sort_by { |t| AvailableTime.find(t.available_time_id).date }
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Your account at Codementorship has been created"
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])    
  end  

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end  

  private

    def user_params
      params.require(:user).permit(:firstname, :lastname, :email, :location, :password,
                                   :password_confirmation)
    end  

    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end    

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end    
end
