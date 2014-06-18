class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #defining in applications controller makes it available to ALL your controllers
  def current_user
  	if cookies[:user_id]
  		User.find(cookies.signed[:user_id])
  	end
  end
  helper_method :current_user

  def signed_in?
  	current_user #if there is a current user, this will be true. If not, then User.find will return nil and this will be false
  end
  helper_method :signed_in?

  # def end_session 
  # end

end
