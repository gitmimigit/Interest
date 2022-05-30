Rails.application.routes.draw do
  devise_for :users
  root to: 'plazas#index'
  resources :plazas, only: :index
  resources :users, only: :show do
    resources :posts, only: :new
  end
  resources :categories, only: :create
  resources :blogs, only: [:index, :create, :show, :edit, :update, :destroy]
end
