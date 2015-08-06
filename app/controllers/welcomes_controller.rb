class WelcomesController < ApplicationController
  layout 'welcome'
  include ModuleUser

  before_action :get_master_all

  def index
  end

  def register
    @register = User.new
  end

  def login
  end

  def create
    @register = User.new(register_params)
    if @register.save 
      flash[:success] = "Thank you for your registration. Please check your email for validating account."
      redirect_to(root_path)
    else
      flash[:danger] = "Error occured while registering your account"
      render :register
    end   
  end

  private
    def register_params 
      params.require(:user).permit(:first_name, :last_name, 
                                   :email, :country, :organization, 
                                   :password, :password_confirmation
                                  )
    end 
end
