Rails.application.routes.draw do

  root 'sessions#new'
  get 'signup' => 'users#new'
  resources :users
  resources :events
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

end
