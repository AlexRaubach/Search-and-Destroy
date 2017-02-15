Rails.application.routes.draw do
  resources :games_users, only: [:update]
  resources :users
  resources :games

  match '/games/:id/place',  to: 'games#place',         via: 'get'


  root 'games#index'
end
