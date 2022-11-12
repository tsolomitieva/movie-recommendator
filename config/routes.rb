require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web, at: "sidekiq"
  devise_for :users
  resources :movies
  resources :categories
  root "movies#index"
end
