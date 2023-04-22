Rails.application.routes.draw do
  # Root route
  root 'pages#index'

  # Sessions routes
  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy', as: 'logout'

  # Pages routes
  get 'pages/index'

  # Collection points routes
  get 'collection_points/search', to: 'collection_points#search'
  get 'collection_points/nearby', to: 'collection_points#nearby'
  resources :collection_points

  # Other resources
  resources :users
  resources :recyclable_materials
end
