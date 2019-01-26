Rails.application.routes.draw do
  root 'contents#index'
  resources :contents

end
