Rails.application.routes.draw do
  
  resources :users
  get "signin", to: "sessions#new"
  get "signup", to: "users#new"
  root "busdetails#index"
  resources :busdetails do
    resources :reservations
  end

  resource :session, only: [:new,:create,:destroy]
  # get '/search', to: "busdetails#search"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
