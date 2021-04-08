class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    user_params = params.require(:user).permit(:name)
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, :notice => "Signed up!"
    else
      render "new"
    end
  end

  def show; end
end

