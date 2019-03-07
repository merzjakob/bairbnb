Rails.application.routes.draw do

  devise_for :users
  get '/dashboard', to: 'profiles#dashboard'
  patch '/bookings/:id/approve', to: 'bookings#approve', as: :approve
    patch '/bookings/:id/decline', to: 'bookings#decline', as: :decline
  root to: 'pages#home'

  resources :flats, only: [:index, :show, :new, :create, :destroy, :update, :edit] do
    resources :bookings, only: [:index, :show, :new, :create, :edit, :update]

    resources :images, only: [:index, :create]
  end
  resources :images, only: [:destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
