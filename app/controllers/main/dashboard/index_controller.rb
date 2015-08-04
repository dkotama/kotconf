class Main::Dashboard::IndexController < ApplicationController
layout 'dashboard'
before_action :init_master, only: [:index]
before_action :check_user_privileges
respond_to :html, :js

def index

end


end
