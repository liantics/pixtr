
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
  root to: "galleries#index"
  


  #white lisitng the routes we ARE allowing

  resources :galleries, only: [:show, :new, :create, :edit, :update, :destroy] do
    # anything inside the do block on a resource in the routes.rb
    #knows it's nested under the path of things in the line that starts the block, 
    # so it fills in the /galleries/:id ... portion of the path for us
    resources :images, only: [:new, :create, :edit, :update, :destroy]
    #rule of thumb: ONLY NEST ONCE
  end

  resources :users, only: [:create]
  get "/sign_up", to: "users#new"

  resource :session, only: [:create, :destroy] #note: there's only ONE session for a user, so this MUST be singular. It's one of the exceptions in routes.
  get "/sign_in", to: "sessions#new"
  get "/sign_out", to: "sessions#delete"

  

end
