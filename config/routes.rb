Rails.application.routes.draw do
  resources :users
  resources :roles
  resources :views
  root 'home#index'
end
