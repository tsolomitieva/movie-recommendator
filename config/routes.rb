require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web, at: "sidekiq"
  root "movies#index"
  devise_for :users
  resources :movies
  resources :categories
  resources :users_movies do
    post  :add_to_list, on: :member
  end

  namespace :admin do 
    resources :users do
      post :ban_account, on: :member
    end
    resources :movies
    resources :categories
  end

end
