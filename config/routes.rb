Rails.application.routes.draw do
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  mount Attachinary::Engine => "/attachinary"

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :profiles, only: [:show, :edit, :update]
  # resources :discussions
  resources :companies, only: [:show, :new, :create] do
    resources :users, only: [:show]
  end

  resources :projects, only: [:index, :show] do
    get '/dashboard' => 'dashboard#show', as: :user_dashboard
    post '/dashboard/message' => 'dashboard#message'
    patch '/dashboard/agreed' => 'dashboard#agreed'
    resources :roles, only: [:index, :show]
  end

  namespace :cview do
    resources :discussions, param: :project_id do
      post '/roles/:role_id/model/:id' => 'model#create', as: :role_model_create
      patch '/roles/:role_id/model/:id/accept' => 'model#accept', as: :role_model_accept
      resources :list_role, only: [:index]
      resources :roles, only: [:path] do
        resources :list_model, only: [:index]
      end
    end

    resources :roles, only: [] do
      resources :model, only: [:show]
    end

    resources :companies, only: [:show, :edit, :update, :destroy]
    resources :projects do
      resources :roles do
        resources :models, except: [:index, :destroy]
      end
    end
  end
end
