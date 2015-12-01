class TransactionsController < ApplicationController

  def new
    @user = current_user
    @transaction = Transaction.new
  end

  def create
    @user = current_user
    @transaction = @user.transactions.new(available_time_id: params[:available_time_id])

    if @transaction.save
      redirect_to user_path(@user)
    else
      render 'show'
    end
  end

end
