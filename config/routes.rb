BookFavs::Application.routes.draw do

  resources :users
  resources :books
  resources :favorites

  root to: 'sessions#new'

  post '/sessions' => 'Sessions#create'
  get '/logout' => 'Sessions#destroy'

  
end
