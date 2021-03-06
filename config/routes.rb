Rails.application.routes.draw do
  root to: 'toppages#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new', as:'users'
  post 'signup', to: 'users#create'

  resources :comics, only: [:show, :new, :create, :edit, :update, :destroy]
end 