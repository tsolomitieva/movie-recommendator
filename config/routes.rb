Rails.application.routes.draw do
  devise_for :users
  resources :movies
  resources :categories
  root "movies#index"
end
