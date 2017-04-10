Rails.application.routes.draw do
  devise_for :users
  resources :films do
    resources :reviews
  end
  root 'films#index'
end
