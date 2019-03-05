Rails.application.routes.draw do
  get 'flats/index'
  get 'flats/show'
  get 'flats/new'
  get 'flats/create'
  get 'flats/destroy'
  get 'flats/update'
  devise_for :users
  root to: 'pages#home'
  resources :flats, only: [:index, :show, :new, :create, :destroy, :update]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
