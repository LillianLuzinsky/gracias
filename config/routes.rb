Rails.application.routes.draw do
  get 'sessions/new'
  resources :users
  root 'posts#index'

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'login', to: 'sessions#destroy', as: 'logout'
  
  resources :users
  resources :sessions
end
