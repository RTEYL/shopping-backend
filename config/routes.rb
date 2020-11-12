Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :items
      resources :users, only: [:index, :show]
    end
  end
  post :sign_up, to: 'registrations#create'
  post :login, to: 'sessions#create'
  post :logout, to: 'sessions#logout'
  get :logged_in, to: 'sessions#logged_in'
  root to: 'static#home'
end