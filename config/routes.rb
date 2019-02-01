Rails.application.routes.draw do
  devise_for :operators
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
  get '/game/:id/switch' => 'games#switch', as: 'switch_game'
end
