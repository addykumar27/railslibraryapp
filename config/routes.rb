Rails.application.routes.draw do #rails will list our routes.get '/' to get user index
  root to: 'users#index'

   resources :users

  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'
  post '/sessions', to: 'sessions#create'
  get 'libraries', to: 'libraries#index'
  get '/libraries/new', to: 'libraries#new', as: 'new_library'
end
