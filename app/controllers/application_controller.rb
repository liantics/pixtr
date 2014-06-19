class ApplicationController < ActionController::Base

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #Adds the monban authentication helpers to our application
  include Monban::ControllerHelpers 

  #below is the "umbrella of protection" - everyone bounces off unless logged in
  #there is an exception in the sessions controller
  #that skips this "before" action
  #so people can create accounts and sign in
  before_action :require_login #require_login is provided by monbon auth gem

end
