Rails.application.routes.draw do
  namespace :dashboard do
    root to: 'top#index'

    get 'login' => 'sessions#new', :as => :login
    post 'logout' => 'sessions#destroy', :as => :logout

    resources :sessions, only: %i[new create destroy]
    resources :sites, only: %i[show edit update]
  end
  root to: 'top#index'
end
