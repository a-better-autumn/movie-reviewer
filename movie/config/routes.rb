Rails.application.routes.draw do
  devise_for :users
  resources :films
  root 'welcome#index'
end
