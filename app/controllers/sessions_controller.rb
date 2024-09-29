class SessionsController < ApplicationController
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
  
  

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged out!"
  end
end
