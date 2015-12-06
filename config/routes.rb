Rails.application.routes.draw do
  root to: 'companies#index'
  resources :companies
  resources :sessions, only: [:login, :logout, :create]

  match '/login', via: [:get], to: 'sessions#login'
  match '/logout', via: [:get], to: 'sessions#logout'
  match '/register', via: [:get], to: 'companies#new'
  match '/welcome', via: [:get], to: 'companies#welcome'
end
