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
    if !User.exists?(:id => params[:id])
      @id    = params[:id]
      @token = params[:token]
    else
      flash[:danger] = "Your account already validated"
      redirect_to(root_path)
    end
  end

  def activate
    if params[:id].present? && params[:token].present? 
      id    = params[:id]
      token = params[:token]

      userNew = UserRegister.find(id)
      user    = nil 

      if User.exists?(:id => id) 
        flash[:danger] = "Your account already validated"
      elsif userNew.token == token 
        user = User.new(
              :id              => userNew.id,
              :email           => userNew.email,
              :password_digest => userNew.password_digest,
              :first_name      => userNew.first_name,
              :organization    => userNew.organization,
              :country         => userNew.country
             )

        if user.save
          flash[:success] = "Your account was activated, please login to access conferences"
        else
          flash[:danger] = "Something error occurred while we creating your account."
        end
      else
        flash[:danger] = "Incorrect Token, please check your email"
      end 
    end

    redirect_to(root_path);
  end

  def create
    @register = UserRegister.new(register_params) 

    if @register.valid? 
      @register.token = SecureRandom.urlsafe_base64(16);
      @register.save  
      url = request.host + ':' + request.port.to_s

      RegistrationMailer.email_token(@register, url).deliver_now

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
