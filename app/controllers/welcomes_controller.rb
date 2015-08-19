class WelcomesController < ApplicationController
  layout 'welcome'

  before_action :get_master_all

  def index
  end

  def register
    @register = User.new
    @sender   = 'welcome'
  end

  def login
  end

end
