Rails.application.routes.draw do
  namespace :admin do
    resources :users
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

  resources :lists do
    resources :items
  end

end
