Rails.application.routes.draw do

  get 'category_crops/new'

  get 'category_crops/create'

  get 'category_crops/show'

  get 'category_crops/edit'

  get 'category_crops/update'

  get 'categories/new'

  get 'categories/show'

  get 'categories/index'

  # Sessions: /sessions
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  # Users: /users
  get 'signup' , to: 'users#new'
  resources :users, only: [:show, :create]

  # Donations: /donations
  resources :donations, only: [:show, :create, :index, :new, :edit, :update, :destroy]

  # Crops: /crops
  resources :crops

  # Categories: /categories
  resources :categories

  # Category Crops
  resources :category_crops

  # Searches: /searches
  resources :searches, only: [:new, :show, :create]

  # Static Pages: /static_pages
  get 'static_pages/about'
  get 'static_pages/home'
  get 'static_pages/help'

  root 'static_pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
