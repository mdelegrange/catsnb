Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cats, only: [:index, :show] do
    resources :bookings, only: [:create]
  end

  resources :bookings, only: [:index, :show] do
    resources :reviews, only: [:new, :create]
  end

  namespace :owner do
    resources :cats, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :bookings, only: [:index, :show] do
      member do
        patch :accept
        patch :deny
      end
    end
  end

  resource :profile, only: [:show, :edit, :update]
end
