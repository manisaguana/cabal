Rails.application.routes.draw do
  root 'home#index'

  resources :users, except: [:new, :index]
  get '/signup', to: 'users#new'

end
