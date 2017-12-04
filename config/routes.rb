Rails.application.routes.draw do
  get 'weight/index'

  get 'height/index'

  get 'gender/index'

  get 'corpulence/index'

  get 'hair_color/index'

  get 'skin_color/index'

  get 'haircut/index'

  get 'ethnicity/index'

  get 'countries/index'

  get 'messages/index'

  get 'messages/show'

  get 'messages/create'

  get 'messages/new'

  get 'messages/edit'

  get 'messages/update'

  get 'messages/destroy'

  get 'discussions/index'

  get 'discussions/show'

  get 'discussions/create'

  get 'discussions/new'

  get 'discussions/edit'

  get 'discussions/update'

  get 'discussions/destroy'

  get 'skills/index'

  get 'skills/show'

  get 'skills/create'

  get 'skills/new'

  get 'skills/edit'

  get 'skills/update'

  get 'skills/destroy'

  get 'review_users/index'

  get 'review_users/show'

  get 'review_users/create'

  get 'review_users/new'

  get 'review_users/edit'

  get 'review_users/update'

  get 'review_users/destroy'

  get 'review_projects/index'

  get 'review_projects/show'

  get 'review_projects/create'

  get 'review_projects/new'

  get 'review_projects/edit'

  get 'review_projects/update'

  get 'review_projects/destroy'

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :companies do
    resources :legal_representatives
  end
  resources :projects do
    resources :roles do
      resources :pools, except: [:index, :destroy]
    end
  end
end
