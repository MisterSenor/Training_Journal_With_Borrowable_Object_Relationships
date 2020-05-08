Rails.application.routes.draw do

  root "sessions#index"

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  resources :goals
  resources :workouts do
    resources :exercises, only: [:index, :new, :create]
  end

  resources :exercises
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
