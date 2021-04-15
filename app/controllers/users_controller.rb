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

  def create_session
    
    user_params = params.require(:user).permit(:name)
    @user = User.find_by(user_params)
    if !@user.nil?
      session[:user_id] = @user[:id]
      redirect_to @user, :notice => "Logged in!"
    else
      flash.now.alert = "User does not exist"
      render "new"
    end
  end

  def destroy_session
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end

  def show
    @user = User.find_by_id(params[:id])
  end
end

