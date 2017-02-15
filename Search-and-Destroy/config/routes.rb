Rails.application.routes.draw do

  resources :users
  resources :games

  root 'games#index'
end
