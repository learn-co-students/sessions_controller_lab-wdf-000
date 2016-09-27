class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?

  def hello
    # when user logged out
      # renders homepage with a login link
    # when logged in
      # greet user and provide login link
    render 'hello'
  end

  def current_user
    session[:name]
  end

  def logged_in?
    current_user != nil
  end
end
