class UserController < ApplicationController

respond_to :js

  def register
    @user = User.new
  end

  def index
    redirect_to user_register_path
  end

  def create
  end
end
