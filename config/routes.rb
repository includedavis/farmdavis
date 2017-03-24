Rails.application.routes.draw do

  # Sessions: /sessions
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  # Users: /users
  get 'signup' , to: 'users#new'
  resources :users, only: [:show, :create]

  # Donations: /donations
  resources :donations, only: [:show, :create, :index, :new, :edit, :update]

  # Static Pages: /static_pages
  get 'static_pages/about'
  get 'static_pages/home'
  get 'static_pages/help'

  root 'static_pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
