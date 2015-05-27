Rails.application.routes.draw do
  resources :users
  resources :roles
  resources :views, only: [:index]
  root 'home#index'
end
