class Main::Dashboard::DashboardsController < ApplicationController
layout 'dashboard'
  def index
      Rails.logger.info "WELCOME TO DASHBOARD"
  end
end
