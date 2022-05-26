Rails.application.routes.draw do
  resources :plazas, only: :index
end
