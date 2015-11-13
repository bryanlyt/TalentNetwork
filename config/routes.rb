Rails.application.routes.draw do

  resources :conversations, only: [:index, :show, :destroy] do
    member do
      post :reply, :restore, :mark_as_read
    end
    collection do
      delete :empty_trash
    end
  end

  resources :messages, only: [:new, :create]

  resources :projects

  resources :users, only: [:show, :index]

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
