class SessionsController < ActionController::Base

  def login

  end

  def create
    if params[:name] == nil || params[:name].empty?
      return redirect_to :login
    else
      session[:name] = params[:name]
      return redirect_to root_path if logged_in? 
    end
  end

  def destroy
    if session[:name] != nil
      session[:name] = nil
    end
    render :new
  end

  private

  def logged_in?
    session[:name] != nil ? true : false
  end
end

