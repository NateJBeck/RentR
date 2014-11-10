Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]

  resources :users, only: [:new, :create, :show] do
    resources :listings, only: [:index, :new, :create]
  end

  root "listings#index"
end
