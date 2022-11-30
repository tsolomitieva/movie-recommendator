require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web, at: "sidekiq"
  devise_for :users
  resources :movies, only: [:index, :show]
  resources :categories, only: [:index]
  root "movies#index"

  namespace :admin do 
    resources :users
    resources :movies
    resources :categories
  end

end
