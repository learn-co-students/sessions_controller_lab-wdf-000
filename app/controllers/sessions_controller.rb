class SessionsController < ApplicationController
  protect_from_forgery :with => :exception
  def new
  end

  def create
    if params[:name].nil? || params[:name].empty?
      redirect_to '/sessions/new'
    else
      session[:name] = params[:name] 
      redirect_to '/'
    end
  end

  def destroy
    session[:name] = nil if session[:name]
    redirect_to '/'
  end
end
