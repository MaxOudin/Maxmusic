Rails.application.routes.draw do
  # root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "music#index"

  resources :artist, only: %i[index show]
  resources :music, only: %i[index show]
end
