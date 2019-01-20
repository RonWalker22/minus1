Rails.application.routes.draw do
  resources :recipes
  resources :rooms
  resources :teams
  resources :objectives
  resources :strategies
  devise_for :operators

  unauthenticated do
    root to: 'static_pages#about'
  end

  authenticated do
    root to: 'static_pages#about'
  end

  get '/about' => 'static_pages#about'
end
