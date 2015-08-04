class WelcomesController < ApplicationController
  layout 'welcome'
  include ModuleUser

  before_action :get_master_all, only: [:index, :register, :login]

  def index
  end

  def register
    @register = User.new
  end

  def login
  end

  def create
    @register = User.new(register_params)
    render :register
  end

  private
    def register_params 
      params.require(:user).permit(:email, :password, :password_confirmation)
    end 
end
