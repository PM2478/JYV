Rails.application.routes.draw do
  devise_for :users
  resources :relationships, only: [:create, :destroy]
  
  resources :posts do
   member do
    put 'Yes' => 'posts#upvote'
    put 'No' => 'posts#downvote'
   end
  end


  
  resources :users do
    member do
      get :following, :followers
    end
  end
  # Define Root URL  root 'pages#index'
  root 'pages#index'
  
   # Define Routes for Pages
   get '/home' => 'pages#home' # override default routes.
   get '/user/:id' => 'pages#profile'
   get '/explore' => 'pages#explore'

  namespace :charts do 
    get "votes"
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
