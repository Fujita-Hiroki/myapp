Rails.application.routes.draw do
  get 'users/new'
  root    'static_pages#home'
  get     '/about',   to: 'static_pages#about'
  #get    '/login'
  #post   '/login'
  #delete '/logout'
  # get     '/signup',   to: 'users#new'
  get     'users/new'
end
