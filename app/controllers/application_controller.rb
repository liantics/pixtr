class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #Adds the monban authentication helpers to our application
  include Monban::ControllerHelpers 

end
