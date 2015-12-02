class TransactionsController < ApplicationController

  def new
    @user = current_user
    @transaction = Transaction.new
  end

  def create
    @user = current_user
    @transaction = @user.transactions.new(available_time_id: params[:available_time_id])

    if @transaction.save
      flash[:success] = "You made a reservation successfully!"
      redirect_to user_path(@user)
    else
      render 'show'
    end
  end

  def update

    transaction = Transaction.find(params[:id])

    if transaction.update_column(:status, "ok")
      flash[:success] = "Reserve confirmed"
      redirect_to dashboard_path(current_expert)
    else  
      redirect_to experts_path
    end
  end



end
