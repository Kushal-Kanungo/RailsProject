Rails.application.routes.draw do
  get 'home/index'
  root 'home#index'
  get 'home/about'

  # get '/articles', to: 'articles#index'
  # get "/articles/:id", to: 'articles#show'

  # ? It makes all convenstional routes for us like create, read, update, delete
  resources :articles

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
