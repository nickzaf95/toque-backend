Rails.application.routes.draw do
  resources :recipes
  resources :inclusions
  resources :users
  resources :families
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end