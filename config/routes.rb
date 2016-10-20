Rails.application.routes.draw do
  get 'rooms/show'

  get 'sessions/new'

  root 'home#index'

  get    '/signup', to: 'users#new'
  resources :users, except: [:new, :index]

  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

end
