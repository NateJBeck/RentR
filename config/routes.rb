Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]

  resources :users, only: [:new, :create, :show] do
    resources :listings, only: [:index, :new, :create, :destroy, :update, :edit]
  end

  resources :listings, only: [:index, :show] do
    resource :like, only: [:create, :destroy]
    resources :requests, only: [:new, :create]
  end

  resources :requests, only: [:index]

  root "listings#index"
end
