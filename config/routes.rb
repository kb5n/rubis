Rails.application.routes.draw do
  namespace :dashboard do
    root to: 'top#index'

    get 'login' => 'sessions#new', :as => :login
    post 'logout' => 'sessions#destroy', :as => :logout

    resources :sessions, only: %i[new create destroy]
  end
  root to: 'top#index'
end
