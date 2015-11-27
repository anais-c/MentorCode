Rails.application.routes.draw do
  root 'users#home'
  get 'signup' => 'users#new'
end
