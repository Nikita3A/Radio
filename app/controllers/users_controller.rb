class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Account created successfully! Please sign in."
      redirect_to signin_path
    else
      flash.now[:error] = "There was an error signing up."
      render 'new', status: :unprocessable_entity
    end
  end

  private

  # Strong parameters to whitelist the input fields
  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
