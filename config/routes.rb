Rails.application.routes.draw do
  get 'sessions/new'
  resources :users
  root 'pages#index'

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  get 'journal', to: 'pages#journal'
  get 'journal/answer', to: 'pages#show_answers'
  post 'journal/answer/:question_id', to: 'pages#submit_answer'

  resources :users
  resources :sessions
end
