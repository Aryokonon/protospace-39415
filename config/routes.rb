Rails.application.routes.draw do
  devise_for :users

  root 'prototypes#index'

  resources :prototypes do
    resources :comments, only: [:create]
    
    collection do
      get 'search', to: 'prototypes#search'
    end

    member do
      get 'edit'
    end
  end

  resources :users, only: [:show]
  resources :comments, only: [:index, :show]
end