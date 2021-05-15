class UsersController < ApplicationController
  def new
    redirect_to current_user if current_user

    @user = User.new
  end

  def create
    user_params = params.require(:user).permit(:name)
    @user = User.new(user_params)

    ok = true

    if @user[:name].empty?
      flash[:alert] = 'User can not be empty'
      ok = false
    end

    if User.all.any? { |uss| uss[:name] == @user[:name] }
      flash[:alert] = 'User already exists'
      ok = false
    end

    if @user.save && ok
      redirect_to root_path, notice: "#{@user[:name]} was created!"
    else
      render 'new'
    end
  end

  def create_session
    user_params = params.require(:user).permit(:name)
    @user = User.find_by(user_params)
    if !@user.nil?
      puts "USER: #{@user[:id]}"
      session[:user_id] = @user[:id]
      puts "SESSION: #{session[:user_id]}"
      flash[:notice] = 'Logged in!'
      redirect_to @user
    else
      flash[:alert] = 'User does not exist'
      redirect_to ''
    end
  end

  def destroy_session
    session[:user_id] = nil
    redirect_to root_url, notice: 'Logged out!'
  end

  def show
    @user = current_user
    @title = 'Profile'
  end

  def edit
    @user = current_user
  end

  def update
    user_params = params.require(:user).permit(:image)

    @user = current_user

    @user.image.attach(user_params[:image])

    redirect_to @user
  end
end
