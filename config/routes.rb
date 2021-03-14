Rails.application.routes.draw do
  resources :books, except: [:index]
  resources :book_comments, only: [:create, :destroy]
  root to: 'pages#welcome'
  devise_for :users

  get '/profile', to: 'pages#profile', as: 'pages_profile'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end