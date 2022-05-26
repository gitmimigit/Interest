Rails.application.routes.draw do
  root to: 'plazas#index'
  resources :plazas, only: :index
end
