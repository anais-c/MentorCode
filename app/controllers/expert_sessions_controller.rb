class ExpertSessionsController < ApplicationController
  def new
  end

  def create
    expert = Expert.find_by(email: params[:session][:email].downcase)
    if expert && expert.authenticate(params[:session][:password])
      log_in_expert expert

      redirect_to expert_path(expert)
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out_expert
    redirect_to root_path
  end
end
