Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]

  resources :users, only: [:new, :create, :show] do
    resources :listings, only: [:index, :new, :create, :destroy, :update, :edit]
  end

  resources :likes, only: [:index]

  resources :listings, only: [:index, :show] do
    resource :like, only: [:create, :destroy]
    resources :booking_requests, only: [:new, :create, :show,
                                        :edit, :update, :destroy]
  end

  resources :booking_requests, only: [:index]

  resources :locations, only: [:index, :show]

  root "locations#index"
end
