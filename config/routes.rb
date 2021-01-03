Rails.application.routes.draw do
  #resources :articles #this gives all routes for articles
  root 'pages#home'
  get 'about', to: 'pages#about'
  resources :articles, only: [:show] #this limits the routes 
  
end
