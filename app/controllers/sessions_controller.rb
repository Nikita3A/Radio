class SessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]

  def new
  end

  def create
    @user = User.find_by(username: params[:username])
  
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Logged in successfully"
    else
      flash.now[:error] = "Invalid credentials"  # This sets the flash for the current request
      render :new  # Renders the new template on failure
    end
  end
  
  def redirect_if_logged_in
    redirect_to root_path if current_user # Redirects to root if the user is already logged in
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged out!"
  end
end
