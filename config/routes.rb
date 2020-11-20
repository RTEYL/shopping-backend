Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :items
      resources :users do
      resources :orders, only: [:create, :show]
      end
    end
  end
  post 'guest/orders', to: 'api/v1/orders#create'
  post :sign_up, to: 'registrations#create'
  post :login, to: 'sessions#create'
  post :logout, to: 'sessions#logout'
  get :logged_in, to: 'sessions#logged_in'
end