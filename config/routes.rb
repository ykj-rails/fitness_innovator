Rails.application.routes.draw do
  devise_for :users
  root 'contents#index'
  resources :contents do
    member do
      get :comments_show
    end
    resources :comments, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update, :avatar_destroy] do
    member do
      delete 'avatar_destroy'
    end
  end
  resources :likes, only: [:create, :destroy]
end
