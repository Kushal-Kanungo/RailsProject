Rails.application.routes.draw do
  get 'task/index'
  get 'home/index'
  root 'articles#index'
  get 'home/about'

  # ? Api

  get 'api/articles', to: 'article_api#all_articles'
  get 'api/article/:id', to: 'article_api#article_by_id'
  # get '/articles', to: 'articles#index'
  # get "/articles/:id", to: 'articles#show'

  get 'api/articles/test', to: 'article_api#test_route', as: 'test_route'

  # ? It makes all convenstional routes for us like create, read, update, delete
  resources :articles

  get 'tasks', to: 'task#index'
  post 'tasks', to: 'task#create'
  get 'tasks/:id', to: 'task#show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"


  get 'parameter', to: 'parameter#index'
end
