Rails.application.routes.draw do

  get 'experts_signup' => 'experts#new' 
  get 'sessions/new'

  root 'users#home'
  get 'signup' => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'  
  resources :users
  resources :experts
  
end
