module ExpertSessionsHelper

  include SessionsHelper

  def log_in_expert(expert)
    session[:expert_id] = expert.id
  end

  def current_expert
    @current_expert ||= Expert.find_by(id: session[:expert_id])
  end 

  def logged_in_expert?
    !current_expert.nil?
  end   

  def log_out_expert
    session.delete(:expert_id)
    @current_expert = nil
  end  
end
