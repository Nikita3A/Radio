# Rails.application.routes.draw do
#   # Root route, when you visit the homepage
#   root 'pages#home'
  
#   # Routes for signup
#   get '/signup', to: 'users#new'
#   post '/signup', to: 'users#create'

#   # Routes for signin
#   get '/signin', to: 'sessions#new'
#   post '/signin', to: 'sessions#create'
#   delete '/signout', to: 'sessions#destroy' # Correctly set up for signout

#   # Add to playlist action
#   post 'add_to_playlist', to: 'playlists#add_to_playlist'

#   # Routes for albums (only index and show actions)
#   resources :albums do
#     resources :songs
#   end

#   # RESTful routes for playlists
#   resources :playlists do
#     delete 'remove_song/:song_id', to: 'playlists#remove_song', as: 'remove_from_playlist'
#   end
# end
Rails.application.routes.draw do
  get 'playlists/new'
  get 'playlists/create'
  get 'playlists/index'
  get 'playlists/show'
  get 'pages/home'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  get 'users/new'
  get 'users/create'
  # Root route, when you visit the homepage
  root 'pages#home'
  
  # Routes for signup
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  # Routes for signin
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'

  post 'add_to_playlist', to: 'playlists#add_to_playlist'

  # Routes for albums (only index and show actions)
  resources :albums do
    resources :songs
  end

  resources :playlists

  resources :playlists do
    delete 'remove_song/:song_id', to: 'playlists#remove_song', as: 'remove_from_playlist'
  end
  
  
end
