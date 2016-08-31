class SessionsController < ApplicationController
  
  def new
  end

  def create
  	if params[:name] && !params[:name].empty?
  	  session[:name] = params[:name]
  	  redirect_to '/'
  	else
  	  redirect_to login_path
  	end
  end

  def show
  end

  def destroy
  	if session.present?
  		session.clear
  	end
  	redirect_to '/'
  end

end
