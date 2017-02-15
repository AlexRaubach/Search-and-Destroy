Rails.application.routes.draw do
  # get 'games/index'

  # get 'games/new'

  # get 'games/show'

  # get 'gamelobby/index'

  resources :users
  resources :games

  root 'games#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
