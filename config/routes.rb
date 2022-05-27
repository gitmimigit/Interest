Rails.application.routes.draw do
  devise_for :users
  root to: 'plazas#index'
  resources :plazas, only: :index
  resources :users, only: :show
end
