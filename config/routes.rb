Rails.application.routes.draw do
  namespace :api do
    resources :patients, defaults: {
      format: :json
    }
  end
end
