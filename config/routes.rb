Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    post :login, to: 'sessions#login'
    post :signup, to: 'sessions#signup'
  end
end
