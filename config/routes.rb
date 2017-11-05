Rails.application.routes.draw do
  root to: 'welcome#home'

  # sessions
  get '/signin', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'

  # users
  resources :users, except: [:index, :destroy]

  # attractions
  resources :attractions, except: [:destroy]

  # rides
  post '/rides/new', to: 'rides#new'

end
