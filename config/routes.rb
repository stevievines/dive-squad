Rails.application.routes.draw do

  root to: 'dashboards#show'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  get '/signup' => 'coaches#new'

  get 'auth/google_oauth2/callback' => 'google_drives#create'

  post 'diver_practices/set_minutes_late' => 'diver_practices#set_minutes_late'
  post 'diver_practices/set_excuse' => 'diver_practices#set_excuse'

  resource :dashboard, only: :show
  resource :settings, only: :show
  resources :coaches, only: [:create, :update, :show]
  resources :teams do
    resources :practices, only: [:destroy] do
      collection do
        post :add_practices
        post :export_practices
      end
    end
    resource :attendance, only: :show
    # TODO: move to reporting module?
    resource :attendance_report, only: :show
  end
  resources :divers do
    member do
      post :deactivate
    end
    resources :diver_practices do
      member do
        post :toggle_attendance
      end
    end
    resources :lists, only: [:new, :edit, :create, :show, :update, :destroy] do
      resources :list_dives, only: [:new, :create]
    end
  end
  # NOTE: should be nested resource, not sure how to do the form_for from dashboard that way
  resources :goals, only: [:create, :edit, :index]
end
