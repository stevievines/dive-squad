Rails.application.routes.draw do

  root to: 'dashboards#show'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  get '/signup' => 'coaches#new'
  resource :dashboard, only: :show
  resources :coaches, only: [:create, :show]
  resources :teams
  resources :divers do
    resources :lists, only: [:new, :edit, :create, :show, :update, :destroy] do
      resources :list_dives, only: [:new, :create]
    end
  end
end
