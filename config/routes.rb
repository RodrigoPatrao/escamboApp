Rails.application.routes.draw do

  namespace :site do
    get '/', to: 'homepage#index'
    namespace :profile do
      resources :dashboard, only: [:index]
      resources :ads, only: [:index, :edit, :update, :destroy]
    end
  end

  namespace :backoffice do
    resources :send_mail, only: [:edit, :create]
    resources :categories, except: :show
    resources :admins, except: :show
  end

  devise_for :admins, skip: :registrations
  devise_for :members

  root to: 'site/homepage#index'
  get 'admin', to: 'backoffice/dashboard#index'

end
