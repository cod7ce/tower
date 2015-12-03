class ApplicationController < ActionController::Base
  include Pundit
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # mock a login user
  def current_user
    session[:user_id].nil? ? User.first : User.find(session[:user_id])
  end
end
