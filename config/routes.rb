Rails.application.routes.draw do
  root 'games#index'

  resources :boards, only: [:new, :update, :create]
  resources :users
  resources :games

  match '/games/:id/place',  to: 'games#place',         via: 'get'

  match '/games/:id/waiting', to: 'games#waiting', via: 'get'


end
