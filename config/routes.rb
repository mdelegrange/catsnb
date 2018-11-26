Rails.application.routes.draw do
  get 'cats/index'
  get 'cats/show'
  root to: 'pages#home'
  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cats, only: [:index, :show] do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:index, :show]

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
