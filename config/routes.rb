Rails.application.routes.draw do
  resources :recipes
  resources :inclusions
  resources :users
  resources :families
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post "/sign-in", to: "users#sign_in"
  get "/validate", to: "users#validate"
  post "/sign-up", to: "users#signup"
  post "/create-family", to: "families#create_family"
  post "/create-recipe", to: "recipes#create_recipe"
  get "/families", to: "families#index"
end
