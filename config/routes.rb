require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web, at: "sidekiq"
  root "movies#index"
  devise_for :users
  resources :movies, only: [:index, :show] do
    post :add_to_list, on: :member
    delete :remove_from_list, on: :member
  end
  resources :categories
  
 
  namespace :admin do 
    resources :users do
      post :ban_account, on: :member
    end
    resources :movies
    resources :categories
  end

end
