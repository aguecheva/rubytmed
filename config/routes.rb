Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    post :login, to: 'sessions#login'
    post :signup, to: 'sessions#signup'
    post :patients, to: 'patients#create'
    get :patients, to: 'patients#show'
  end
end
