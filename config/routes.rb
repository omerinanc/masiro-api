Rails.application.routes.draw do
  namespace :api do
    resources :users, only: [:create], param: :confirmation_token
  end
  post '/sessions', to: 'sessions#create'
  resources :sessions, only: [:create]
  delete :logout, to: "sessions#logout"
  get :logged_in, to: "sessions#logged_in"

  root to: "static#home"

end
