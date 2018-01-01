Rails.application.routes.draw do

  namespace :backoffice do
    resources :categories, except: [:show]
  end

  namespace :site do
    get '/', to: 'homepage#index'
  end

  devise_for :admins
  devise_for :members
  root to: 'site/homepage#index'
  get 'admin', to: 'backoffice/dashboard#index'

end
