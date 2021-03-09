Rails.application.routes.draw do
  devise_for :users
  get 'tweets/index'
  root to: "tweets#index"
  resources :users, only: [:edit, :update, :show]
  resources :tweets, only: [:index, :new, :create, :destroy]
end
