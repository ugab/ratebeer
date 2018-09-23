Rails.application.routes.draw do

  resources :users
  root 'breweries#index'
  get 'signup', to: 'users#new'
  get 'kaikki_bisset', to: 'beers#index'
  resources :ratings, only: [:index, :new, :create, :destroy]
  get 'signin', to: 'sessions#new'
  delete 'signout', to: 'sessions#destroy'

  resources :beers
  resources :breweries
  resource :session, only: [:new, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
