class SessionsController < ApplicationController
  def new
  end

  def create
    if !params[:name].nil? && params[:name] != ''
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
