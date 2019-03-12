Rails.application.routes.draw do
  get 'comments/create'
  get 'comments/destroy'
  devise_for :users
  root 'contents#index'
  resources :contents
  resources :users, only: [:show, :edit, :update, :avatar_destroy] do
    member do
      delete 'avatar_destroy'
    end
  end

end
