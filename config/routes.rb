Rails.application.routes.draw do
  root to: 'pages#welcome'

  resources :books, except: [:index]
  resources :book_comments, only: [:create, :destroy]

  devise_for :users

  get '/u/:id', to: 'users#show', as: 'user_profile'
  get '/profile', to: 'pages#profile', as: 'pages_profile'
end