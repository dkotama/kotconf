Rails.application.routes.draw do
  get 'welcomes/login'
  get 'welcomes/register'
  post 'welcomes/create'

  namespace :main, path: ':master_url' do
    root 'sites#index'
    get  'sites/login'
    post 'sites/attemp_login'
    namespace :dashboard do
      root 'index#index'
      get 'index/index'
      
      # get 'web_managers/announcement'
      # get 'web_managers/primary'
      # get 'web_managers/others'
      resources :masters
    end
    get '/:action' => 'sites#:action'
  end
  root 'welcomes#index'
end
