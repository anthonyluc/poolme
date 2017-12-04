Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :companies do
    resources :legal_representatives, only: [:new, :edit, :show]
  end
  resources :projects do
    resources :models do
      resources :pools, except: [:index, :destroy]
    end
  end
end
