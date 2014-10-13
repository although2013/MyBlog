Rails.application.routes.draw do

  resources :users
  resources :microposts do
    resources :comments
  end

  resources :photos do
    resources :comments
  end

  resources :sessions, only: [:new, :create, :destroy]

  root to: 'microposts#index'

  get 'products/:id' => 'catalog#view'

  match '/upload',  to: 'photos#new', via: 'get'
  match '/login', to: 'sessions#new', via: 'get'
  match '/register', to: 'users#new', via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'delete'
end
