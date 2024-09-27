class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: "Successfully signed up!"
    else
      render :new
    end
  end

  private

  # Strong parameters to whitelist the input fields
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
