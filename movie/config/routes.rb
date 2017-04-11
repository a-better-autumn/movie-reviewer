Rails.application.routes.draw do

  devise_for :users

  resources :films do
    member do
      post :join
      post :quit
    end

    resources :reviews do
      collection do
        get :hot
      end
    end
  end

  root 'films#index'
end
