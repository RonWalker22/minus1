Rails.application.routes.draw do
  resources :loadouts
  resources :ingredients
  require 'sidekiq/web'

  mount SimpleDiscussion::Engine => "/forum"
  mount ActionCable.server => '/cable'

  authenticate :user, ->(op) { op.has_role?(:admin) } do
    mount Sidekiq::Web => '/sidekiq'
  end

  root to: 'static_pages#about'

  resources :locations
  resources :respawns
  resources :modes
  resources :characters
  devise_for :users,
             controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users, only: [:index, :show]
  resources :games
  resources :levels
  resources :directions
  resources :recipes
  resources :rooms
  resources :teams
  resources :objectives
  resources :strategies

  get '/about' => 'static_pages#about'
  get '/docs' => 'static_pages#docs'
  get '/strategies/:id/xml' => 'strategies#show_xml', as: 'strategy_xml'
  patch '/games/:id/switch/' => 'games#switch', as: 'switch_game'
  put '/users/api_key' => 'users#create_api_key', as: 'api_key'
  put '/teams/:id/link/:game_id' => 'teams#link_game', as: 'game_link'
  delete '/teams/:id/link/:game_id' => 'teams#unlink_game', as: 'game_unlink'
  post 'teams/:id/join' => 'teams#join_team', as: 'join_team'
  post 'teams/:id/change_title' => 'teams#change_member_title',
       as: 'change_member_title'
end
