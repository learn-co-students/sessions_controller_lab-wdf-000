class ApplicationController < ActionController::Base
  def hello
  end

  private
    def current_user
      session[:username]
    end
end
