Rails.application.routes.draw do
  devise_for :users
  root to: 'plazas#index'
  resources :plazas, only: :index
  resources :posts, only: :new
  resources :users, only: :show do
    resources :lists, only: :index
  end
  resources :categories, only: :create
  resources :blogs, only: [:create, :show, :edit, :update, :destroy]
  resources :favorites, only: [:create, :show, :edit, :update, :destroy]
end
