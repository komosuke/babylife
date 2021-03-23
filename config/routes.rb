Rails.application.routes.draw do
  devise_for :users
  get 'tweets/index'
  root to: "tweets#index"
  resources :users, only: [:edit, :update, :show] do
    resources :memories
  end
  resources :tweets, only: [:index, :new, :create,:show, :destroy] do
    collection do
      get :search
    end
    resources :comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
end
