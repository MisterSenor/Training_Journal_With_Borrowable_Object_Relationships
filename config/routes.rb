Rails.application.routes.draw do

  root "sessions#index"

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  resources :sessions
  resources :goals
  resources :workouts
  resources :exercises
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
