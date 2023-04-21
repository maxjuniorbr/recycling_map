Rails.application.routes.draw do
  get 'pages/index'
  get 'collection_points/search', to: 'collection_points#search'
  resources :recyclable_materials
  resources :collection_points
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'pages#index'
end
