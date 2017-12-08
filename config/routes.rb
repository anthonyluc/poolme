Rails.application.routes.draw do
  devise_for :users
  mount Attachinary::Engine => "/attachinary"

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :profiles, only: [:show, :edit, :update]
  resources :discussions
  resources :companies, only: [:show, :new, :create] do
    resources :users, only: [:show]
  end

  resources :projects, only: [:index, :show] do
    resources :roles, only: [:index, :show]
  end

  namespace :cview do
    resources :discussions do
      resources :roles, only: [:show] do
        resources :messages
      end
    end
    resources :companies, only: [:show, :edit, :update, :destroy]
    resources :projects do
      resources :roles do
        resources :models, except: [:index, :destroy]
      end
    end
  end
end
