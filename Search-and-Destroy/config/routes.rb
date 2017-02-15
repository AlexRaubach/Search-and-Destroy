Rails.application.routes.draw do
  get 'gamelobby/index'

  resources :users
  resources :games

  root 'gamelobby#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
