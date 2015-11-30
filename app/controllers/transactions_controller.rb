class TransactionsController < ApplicationController

  def new
    @user = current_user
    @transaction = Transaction.new
  end


  # primero: encontramos el id del available time.
  # segundo: asociamos ese available_time al array de todas las
  # transactions del user

  #def create
    #binding.pry
    #@available_time = AvailableTime.find(params[:available_time_id])
    #@current_user.transactions.new(avaiblable_time_id: available_time, user_id: current_user.id)
      #if 
  #end

  # a user has_many transactions
  def create
    @user = current_user
    @transaction = @user.transactions.new(available_time_id: params[:available_time_id])

    if @transaction.save
      redirect_to root_path
    else
      render 'show'
    end
  end

end
