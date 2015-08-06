class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper ApplicationHelper

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end

  def get_master_all
    @masters = Master.all
  end

  def init_master
    _temp       = params[:master_url];
    @master_url = Master.find_by_url(_temp)
    
    if !@master_url.present?
      flash[:danger] = "Conference ' #{_temp} ' not found."
      redirect_to(root_path)   
    else
      return true
    end
  end

  def check_user_privileges 
    if !is_user_authorized?
      redirect_to main_sites_login_path
    end
  end

  private 
  def is_user_authorized? 
    thisConferenceId = @master_url.id 
    thisUser         = nil

    if session[:userId].present? 
      thisUser       = User.find_by_id(session[:userId])
      isUserAuthored = thisUser.conferences_authored_ids.include? thisConferenceId
    else
      flash[:notice] = "Please login first"
      return false
    end 
    
    if isUserAuthored
      return true
    else
      flash[:notice] = "Sufficient Rights"
      return false
    end
  end
end
