require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web, at: 'sidekiq'
  root 'movies#index'
  devise_for :users
  resources :movies, only: %i[index show] do
    post :add_movie_status, on: :member
    delete :delete_movie_status, on: :member
  end
  resources :categories

  get 'movie_list/:public_list_uid', to: 'users#movie_list', as: 'movie_list'
  post 'add_friend/:friend_id', to: 'users#add_friend', as: 'add_friend'
  delete 'delete_friend/:friend_id', to: 'users#delete_friend', as: 'delete_friend'

  resources :users do
    get :search_user, on: :collection
  end

  namespace :admin do
    resources :users do
      post :ban_account, on: :member
    end
    resources :movies
    resources :categories
  end
end
