class SessionsController < ApplicationController

  def create
    if session[:name] == nil && params[:name] == nil || params[:name] == ""
      redirect_to '/login'
    else
      session[:name] = params[:name]
      redirect_to '/'
    end
  end

  def new
  end

  def destroy
    if session[:name] != nil
      session.clear
    end
  end

end
