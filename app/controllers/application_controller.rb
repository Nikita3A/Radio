class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    helper_method :current_user
      
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
  
    def authenticate_user!
      redirect_to signin_path unless current_user # Change from login_path to signin_path
    end
  end
  