Rails.application.routes.draw do
  resources :locations
  resources :respawns
  resources :modes
  resources :characters
  devise_for :operators,
             controllers: { omniauth_callbacks: 'operators/omniauth_callbacks' }
  resources :operators, only: [:index, :show]
  resources :games
  resources :levels
  resources :ingredients
  resources :recipes
  resources :rooms
  resources :teams
  resources :objectives
  resources :strategies

  unauthenticated do
    root to: 'static_pages#about'
  end

  authenticated do
    root to: 'static_pages#about'
  end

  get '/about' => 'static_pages#about'
  get '/docs' => 'static_pages#docs'
  patch '/games/:id/switch/' => 'games#switch', as: 'switch_game'
  put '/games/:id/favorite' => 'games#favorite', as: 'favorite_game'
  delete '/games/:id/favorite' => 'games#unfavorite'
end
