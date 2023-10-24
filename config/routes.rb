Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :users, only: [:index,:new,:create,:destroy]
  resources :items do
    resources :orders, only: [:index, :create]
  end
end
