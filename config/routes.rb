require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web, at: "sidekiq"
  root "movies#index"
  devise_for :users
  resources :movies, only: [:index, :show] do
    post :add_movie_status, on: :member
    delete :delete_movie_status, on: :member
  end
  resources :categories

  resources :users do
    get 'movie_list/:public_list_uid', to: 'users#movie_list', on: :member
  end
 
  namespace :admin do 
    resources :users do
      post :ban_account, on: :member
    end
    resources :movies
    resources :categories
  end

end
