Rails.application.routes.draw do

  devise_for :users
  get '/dashboard', to: 'profiles#dashboard'
  root to: 'pages#home'
  resources :flats, only: [:index, :show, :new, :create, :destroy, :update] do
    resources :bookings, only: [:index, :show, :new, :create]
    resources :images, only: [:index, :create]
  end
  resources :images, only: [:destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
