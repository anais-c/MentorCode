Rails.application.routes.draw do

  get 'expert_sessions/new'

  get 'experts_signup' => 'experts#new' 
  get 'sessions/new'

  root 'users#home'
  get 'signup' => 'users#new'

  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'  

  get 'experts_login' => 'expert_sessions#new'
  post 'experts_login' => 'expert_sessions#create'
  delete 'experts_logout' => 'expert_sessions#destroy'

  get 'dashboard/:id' => 'experts#dashboard', as: 'dashboard'

  

  resources :users do
    resources :transactions
  end
  

  resources :experts
  resources :tags, only: [:index, :show]
  resources :available_times
end
