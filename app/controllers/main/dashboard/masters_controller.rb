class Main::Dashboard::MastersController < ApplicationController
before_action :all_masters, only: [:index, :create, :update, :destroy]
before_action :set_master, only: [:edit, :update, :destroy, :show]
before_action :init_master
layout 'main'

respond_to :html, :js

def new
  @master = Master.new
end
def create
  @master = Master.create(conf_params)
end

def update
  @master.update_attributes(conf_params)
end

def destroy
  @master.destroy
end

private
  def all_masters
    @masters = Master.all
  end
  def set_master
    @master = Master.find(params[:id])
  end
  def conf_params
    params.require(:master).permit(:title,:url)
  end
end
