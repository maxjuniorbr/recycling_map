Rails.application.routes.draw do
  resources :recyclable_materials
  resources :collection_points
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
