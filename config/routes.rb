Rails.application.routes.draw do


  namespace :backoffice do
    resources :send_mail, only: [:edit, :create]
    resources :categories, except: :show
    resources :admins, except: :show
  end

  namespace :site do
    get '/', to: 'homepage#index'
  end

  devise_for :admins, skip: :registrations
  devise_for :members

  root to: 'site/homepage#index'
  get 'admin', to: 'backoffice/dashboard#index'

end
