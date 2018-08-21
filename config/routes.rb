Rails.application.routes.draw do
  namespace :dashboard do
    root to: 'top#index'

    get 'login' => 'sessions#new', :as => :login
    post 'logout' => 'sessions#destroy', :as => :logout

    resources :sessions, only: %i[new create destroy]
    resources :users, only: %i[show edit update]
    resources :tags, except: %i[show]
    resources :categories, except: %i[show]
    resources :articles, shallow: true do
      resources :sections, except: %i[index show]
      resources :article_tags, only: %i[create destroy]
    end
  end

  root to: 'top#index'

  scope '(:user_identifier)' do
    root to: 'user#index'
    resources :articles, param: :identifier, only: %i[show]
    resources :tags, param: :identifier, only: %i[show]
    resources :categories, param: :identifier, only: %i[show]
  end
end
