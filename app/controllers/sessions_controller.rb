class SessionsController < ApplicationController
  before_action :require_login, only: [:destroy]

  def new
    render 'new'
  end

  def create
    if params[:name].blank?
      redirect_to login_path
    else
      session[:name] = params[:name]
      redirect_to root_path
    end
  end

  def destroy
    session.delete :name
    redirect_to root_path
  end

  private

  def require_login
    redirect_to login_path if session[:name].blank?
  end
end
