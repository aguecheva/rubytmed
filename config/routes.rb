Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    post :login, to: 'sessions#login'
    post :signup, to: 'sessions#signup'

    # Rutas de pacientes
    resources :patients, only: [:index, :create, :show] do
      # Rutas de consultas anidadas dentro de pacientes
      resources :consults, only: [:index, :show, :create]
    end
  end
end
