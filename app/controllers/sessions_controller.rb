class SessionsController < ApplicationController
  def new
  end

  def create
    if params[:name].present?
      session[:name] = params[:name]
      redirect_to '/'
    else
      redirect_to login_path
    end
  end

  def show
  end

  def destroy
    session.delete :name
    redirect_to login_path
  end
end
