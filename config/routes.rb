Rails.application.routes.draw do
  resources :users
  resources :roles
  root 'home#index'
end
