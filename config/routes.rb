Rails.application.routes.draw do
  devise_for :users
  root 'contents#index'
  resources :contents do
    resources :comments, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update, :avatar_destroy] do
    member do
      delete 'avatar_destroy'
    end
  end
end
