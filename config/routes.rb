Rails.application.routes.draw do
  resources :follows
  resources :song_tags
  resources :tags
  resources :comments
  resources :songs
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post "/user/:id/follow", to: 'users#follow'
  post "/user/:id/unfollow", to: 'users#unfollow'

end
