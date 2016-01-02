Rails.application.routes.draw do

  root to: 'dashboards#show'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  get '/signup' => 'coaches#new'
  resource :dashboard, only: :show
  resources :coaches, only: [:create, :show]
  resources :teams, only: [:new, :create, :show, :index]
  resources :divers, only: [:new, :create, :show] do
    resources :lists, only: [:new, :create, :show] do
      resources :list_dives, only: [:new, :create]
    end
  end
end
