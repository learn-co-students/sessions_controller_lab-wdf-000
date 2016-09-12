class SessionsController  < ApplicationController
  before_action :ensure_name, only: [:create]

  def new

  end

  def create
    session[:name] = params[:name]
    redirect_to '/'
  end


  def destroy
    session[:name] = nil unless session[:name].nil?
    redirect_to '/login'
  end

  private
  def ensure_name
    redirect_to '/login' unless !params[:name].nil? && !params[:name].empty?
  end

end
