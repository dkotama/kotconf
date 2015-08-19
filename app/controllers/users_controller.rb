class UsersController < ApplicationController

  def index
  end

  def register
    @register = User.new
    @sender   = 'self'
  end

  def login
    
  end 

  def create
    @register = User.new(register_params) 
    sender    = params[:sender] 

    if @register.valid? 
      token = UserToken.create(:token => SecureRandom.urlsafe_base64(16));
      @register.user_token = token
      @register.save  

      flash[:success] = "Thank you for your registration. Please check your email for validating account."
      redirect_to(root_path)
    else
      flash[:danger] = "Error occured while registering your account"

      if sender == 'welcome'
        redirect_to :index
      end 
    end   
  end

  private
    def register_params 
      params.require(:user).permit(:first_name, :last_name, 
                                   :email, :country, :organization, 
                                   :password, :password_confirmation, :sender
                                  )
    end 
end
