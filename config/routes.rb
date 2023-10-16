Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :users, only: [:index,:new,:create,:destroy]
  resources :items, only: [:index,:new,:create]
  resources :categorys
  resources :conditions
  resources :fee_burdens
  resources :areas
  resources :handling_times
end
