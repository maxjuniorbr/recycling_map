Rails.application.routes.draw do
  root 'pages#index'

  get 'pages/index'
  get 'collection_points/search', to: 'collection_points#search'
  get 'collection_points/nearby', to: 'collection_points#nearby'

  resources :recyclable_materials
  resources :collection_points
end
