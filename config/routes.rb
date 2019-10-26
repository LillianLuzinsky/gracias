Rails.application.routes.draw do
  get 'sessions/new'
  resources :users
  root 'posts#index'
end
