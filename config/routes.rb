Rails.application.routes.draw do
  #you may check using rails routes --expanded
  resources :articles #this gives all routes for articles
  root 'pages#home'
  get 'about', to: 'pages#about'
  get 'signup', to: 'users#new'
  resources :users, except: [:new] #we use except new since signup is named instead of new
  #resources :articles, only: [:show, :index, :new, :create, :edit, :update] #this limits the routes 
  
end
