Rails.application.routes.draw do
  

  get 'sessions/new'

  get 'users/new'

  get 'static_pages/home'

  get '/help',        to:'static_pages#help'
  get '/about',       to:'static_pages#about'
  get '/signup',      to:'users#new'
  get '/contact',     to:'static_pages#contact'
  get '/login',       to:'sessions#new'
  post '/login',      to:'sessions#create'
  delete '/logout',    to:'sessions#destroy'
  
  post '/signup',  to: 'users#create'
  
  
  
  resources :users
  resources :microposts,          only: [:create, :destroy]
  #Fordetails on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root "static_pages#home"
end
