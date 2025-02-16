Rails.application.routes.draw do
  get "sessions/new"
  get "sessions/create"
  get "sessions/destroy"
  get "/login", to: "sessions#new", as: "login"
post "/login", to: "sessions#create"
delete "/logout", to: "sessions#destroy", as: "logout"

  resources :books, only: [:index, :show]
  resources :borrowings, only: [:create, :update, :show]  # Added :show
  resources :users  # Includes all CRUD routes for users
  root "books#index"
end
