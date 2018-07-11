Rails.application.routes.draw do
  resources :follows
  resources :song_tags
  resources :tags
  resources :comments
  resources :songs
  resources :users
  resources :sessions, only: [:new, :create]

  delete '/logout', to: 'sessions#destroy', as: "logout"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post "/user/:id/follow", to: 'users#follow'
  post "/user/:id/unfollow", to: 'users#unfollow'

  post "/songs/:id/comment", to: 'songs#comment'

end
