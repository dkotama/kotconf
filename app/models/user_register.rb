class UserRegister < ActiveRecord::Base
  validates :email, :presence => true
  validates :first_name, :presence => true
  validates :last_name, :presence => true

  validates :password, :presence => true,
                       :length => {:minimum => 6}, 
                        confirmation: true
  has_secure_password
end
