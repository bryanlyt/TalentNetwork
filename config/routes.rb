Rails.application.routes.draw do

  resources :projects

  resources :users, only: :show

  resources :talent_applications, only: :update
  
  resources :talents do
    member do
      get :apply
    end
  end

  devise_for :users, path: :accounts, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  root 'dashboard#index'

end
