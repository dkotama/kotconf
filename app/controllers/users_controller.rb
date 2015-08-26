class UsersController < ApplicationController
  layout 'user'

  def index
  end

  def register
    @register = UserRegister.new
  end

  def login 
  end 

  def verify
    @user  = nil
    @id    = params[:id]

    if @id.present ?
     @user  = nil
    end
    
    @token = params[:token]

    @verify = UserRegister.find()
  end

  def activate
    
  end

  def create
    @register = UserRegister.new(register_params) 

    if @register.valid? 
      @register.token = SecureRandom.urlsafe_base64(16);
      @register.save  

      RegistrationMailer.email_token(@register).deliver_now

      flash[:success] = "Thank you for your registration. Please check your email for validating account."
      redirect_to(root_path)
    else
      flash[:danger] = "Error occured while registering your account"
      render('users/register')
    end   
  end

  private
    def register_params 
      params.require(:user_register).permit(:first_name, :last_name, 
                                   :email, :country, :organization, 
                                   :password, :password_confirmation, :sender
                                  )
    end 
end
