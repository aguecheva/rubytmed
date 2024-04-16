Rails.application.routes.draw do
  root to: 'home#index'

  get 'home/show', to: 'home#show', as: 'home_show'

  get '/patients/new', to: 'patients#new', as: 'new_patient'
  get '/patients/:id', to: 'patients#show', as: 'patient'
  post '/patients', to: 'patients#create'
  get '/patients/:id/edit', to: 'patients#edit', as: 'edit'
  patch '/patients/:id', to: 'patients#update'
  delete '/patients/:id', to: 'patients#destroy'
  get '/patients', to: 'patients#index'



  devise_for :users
  resources :users

  namespace :api do
    resources :patients, defaults: {
      format: :json
    }
  end

  resources :patients do
    resources :consults

  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
