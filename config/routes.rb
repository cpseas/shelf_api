Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :users, only: [:index, :show, :create]
  resources :genres, only: [:index, :show, :create]
  resources :themes, only: [:index, :show, :create]
end
