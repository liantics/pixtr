
  #tells rails to go to => a location and action
  #this is a domain specific language
  #that's a subset of ruby that will work with rails
  #any get request to / should go to the galleries controller
  #and the index action

  #the part on the left is the location, then # then name of an action
  # get "/" => "galleries#index"

  # get "/galleries/new" => "galleries#new"

  # patch "/galleries/:id" => "galleries#update"

  # get "/galleries/:id/edit" => "galleries#edit"

  # delete "/galleries/:id" => "galleries#destroy"

  # get "/galleries/:id/" => "galleries#show"

  # post "/galleries" => "galleries#create"

  
# The following does the same thing as ALL the lines above, and resets the root directory to the galleries root
Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
  
  root to: "galleries#index"
  #white lisitng the routes we ARE allowing

  resources :galleries, only: [:show, :new, :create, :edit, :update, :destroy] 
  resources :images, only: [:new, :create, :edit, :update]

end
