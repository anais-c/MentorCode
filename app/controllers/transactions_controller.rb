class TransactionsController < ApplicationController

  def new
    @user = current_user
    @transaction = Transaction.new
  end
  
  #cuando student hace submit en el botón 'reserve' en un 
  #available_time pasan dos cosas:
  #1. crea nueva transaction(user_id, available_time_id) y con atributo :status --> "pending"
  #2. el available_time asociado a la transaction debe de actualizar
  #   su columna :reserved de "false" a "true"
  def create
    @user = current_user
    chosen_slot_id = params[:available_time_id]

    chosen_slot = AvailableTime.find_by(id: chosen_slot_id)
    chosen_slot.update(reserved: true)
    
    @transaction = @user.transactions.new(available_time_id: chosen_slot_id)

    if @transaction.save
      flash[:success] = "You made a reservation successfully!"
      redirect_to user_path(@user)
    else
      render 'show'
    end
  end

  #cambia el :status por defecto de la transaction ("pending") a "ok"
  def update  
    @transaction = Transaction.find(params[:id])
    
    respond_to do |format|
      if @transaction.update_column(:status, "ok")
        format.html { redirect_to dashboard_path(current_expert) }
        format.js
      else  
        format.html { redirect_to experts_path }
        format.js
      end
    end  
  end


end
