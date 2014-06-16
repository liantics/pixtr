Rails.application.routes.draw do
  #tells rails to go to => a location and action
  #this is a domain specific language
  #that's a subset of ruby that will work with rails
  #any get request to / should go to the galleries controller
  #and the index action

  #the part on the left is the location, then # then name of an action
  get "/" => "galleries#index"
end
