Rails.application.routes.draw do
  resources :recipes, only: [:index, :create]
  
  post '/signup', to: "users#create"
  get '/me', to: "users#show"
  
  post '/login', to: "sessions#login"
  delete '/logout', to: "sessions#logout" 

end
