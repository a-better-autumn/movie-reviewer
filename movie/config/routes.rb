Rails.application.routes.draw do

  devise_for :users

  resources :films do
    member do
      post :join
      post :quit
    end

    resources :reviews      
  end

  namespace :account do
    resources :films
  end

  root 'films#index'
end
