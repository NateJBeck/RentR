Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]

  resources :users, only: [:new, :create, :show] do
    resources :listings, only: [:new, :create, :destroy]
  end

  resources :listings, only: [:index, :show]

  root "listings#index"
end
