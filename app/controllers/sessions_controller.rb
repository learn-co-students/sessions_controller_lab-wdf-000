class SessionsController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def new

  end

  def create
    if params[:name] && params[:name] != ""
      session[:name] = params[:name]
      redirect_to '/'
    else
    redirect_to '/login'
    end
  end

  def destroy
    if session[:name]
      session[:name] = nil
    end
  end

end
