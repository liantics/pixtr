
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

  resources :galleries, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :images, only: [:new, :create, :destroy]
  end

  resources :images, only: [:show, :edit, :update] do 
    resources :comments, only: [:create] #since we already have the form, and new is just for rendering a form, we don't need a "new" route.
    resources :group_images, only: [:create] 
    resource :like, only: [:create, :destroy]
  end

  resources :groups, only: [:new, :create, :index, :show] do #order of routes doesn't matter
    #changed this to a singular, since there will only ever be ONE instance of a given user in a specific group
    #there will only ever be one group id for this user's membership in the group, so we don't care about the group id
    resource :group_membership, only: [:create, :delete] 
  end

  

end
