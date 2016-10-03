class SessionsController < ApplicationController
  before_action :require_name, only: [:create]
  def new
  end

  def create
    session[:name] = params[:name]
    redirect_to controller: 'application', action: 'hello'
  end

  def destroy
    session.delete :name
    redirect_to controller: 'sessions', action: 'new'

  end

  private

  def require_name
    redirect_to(controller: 'sessions', action: 'new') if  !params[:name] || params[:name].empty?
  end
end
