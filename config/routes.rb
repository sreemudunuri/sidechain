Rails.application.routes.draw do
  resources :follows
  resources :song_tags
  resources :tags

  resources :songs
  resources :users
  resources :sessions, only: [:new, :create]

  delete '/logout', to: 'sessions#destroy', as: "logout"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post "/users/:id/follow", to: 'users#follow'
  post "/users/:id/unfollow", to: 'users#unfollow'

end
