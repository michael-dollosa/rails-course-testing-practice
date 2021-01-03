Rails.application.routes.draw do
  #you may check using rails routes --expanded
  #resources :articles #this gives all routes for articles
  root 'pages#home'
  get 'about', to: 'pages#about'
  resources :articles, only: [:show, :index] #this limits the routes 
  
end
