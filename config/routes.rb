Rails.application.routes.draw do
  devise_for :users
  mount Attachinary::Engine => "/attachinary"

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :companies do
    resources :legal_representatives
  end
  resources :projects do
    resources :roles do
      resources :models, except: [:index, :destroy]
    end
  end

  namespace :cview do
    resources :projects do
      resources :roles do
        resources :models, except: [:index, :destroy]
      end
    end
  end
end
