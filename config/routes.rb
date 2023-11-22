Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :recipes, only: %i[index show new create destroy]


  resources :inventory_foods, only: %i[new create destroy]

  resources :inventories, only: %i[index show new create destroy]
  
  resources :recipe_foods, only: %i[new create destroy edit update]

  resources :public_recipies, only: [:index]

  get '/shopping_lists', to: 'shopping_lists#index', as: 'shopping_lists'


  # Defines the root path route ("/")
  root "home#index"
end
