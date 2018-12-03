Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :registered_sites
    root to: "users#index"
  end

  namespace :api do
    namespace :v1 do
      resources :lists do
        resources :items
      end
    end
  end
  root to: 'visitors#index'
  
  devise_for :users
  
  resources :users
  resources :registered_sites

  resources :lists do
    resources :items do
      member do
        post :reorder
      end
    end
  end

  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'

end
