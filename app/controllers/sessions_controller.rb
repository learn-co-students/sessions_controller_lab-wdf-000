class SessionsController < ApplicationController

  before_action :check_login
  skip_before_action :check_login, only: [:new]

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
    session.clear
  end

  def check_login
    if (session[:name].nil? || session[:name].empty?) && !request.post?
      redirect_to '/sessions/new'
    end
  end

  def index
  end

end
