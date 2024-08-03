Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    post :login, to: 'sessions#login'
  end
end
