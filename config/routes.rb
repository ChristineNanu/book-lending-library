Rails.application.routes.draw do
  resources :books, only: [:index, :show]
  resources :borrowings, only: [:create, :update]
  root "books#index"
end
