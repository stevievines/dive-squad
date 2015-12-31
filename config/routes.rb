Rails.application.routes.draw do

  root to: 'teams#index'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  get '/signup' => 'coaches#new'
  resources :coaches, only: [:create, :show]
  resources :teams, only: [:new, :create, :show, :index]
  resources :divers, only: [:new, :create, :show]
end
