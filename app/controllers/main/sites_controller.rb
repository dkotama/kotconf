class Main::SitesController < ApplicationController
  before_action :init_master
  
  def index
  end

  def schedule
  end

  def pricing
  end

  def contact
  end
  
  def login
  end

  def logout
    _temp = 1
    reset_session
    Rails.logger.info(_temp); 
    flash[:notice] = "Successfuly, Logout"
    redirect_to(:action => "login")  
  end

  def attemp_login
   if is_login_success?
     redirect_to(main_dashboard_root_path)
   else
     redirect_to(:action => 'login')
   end
  end

  private

  def is_login_success? 
    if params[:email].present? && params[:password].present?
      found_user = User.find_by_email(params[:email])
    else
      flash[:error] = "Please fill out all credentials needed"
      return false
    end

    if found_user != nil
      authorized_user = found_user.authenticate(params[:password])
    else
      flash[:error] = "User not found"
      return false
    end

    if authorized_user 
      session[:userId] = found_user.id
      return true
    else
      flash[:error] = "Wrong Username / Password"
      return false
    end

  end
end
