Rails.application.routes.draw do
  namespace :api do
    post 'users/baslat_post', to: 'users#baslat_post'
  end
  namespace :api do
    resources :posts, only: [:index, :destroy, :update]
  end
  namespace :api do
    get 'profile', to: 'profiles#profile' # Update this line
  end
  post '/registrations', to: 'registrations#create'
  post '/sessions', to: 'sessions#create'
  resources :sessions, only: [:create]
  delete :logout, to: "sessions#logout"
  get :logged_in, to: "sessions#logged_in"

  root to: "static#home"

end

