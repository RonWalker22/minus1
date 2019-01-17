Rails.application.routes.draw do
  devise_for :operators

  unauthenticated do
    root to: 'static_pages#about'
  end

  authenticated do
    root to: 'static_pages#about'
  end

  get '/about' => 'static_pages#about'
end
