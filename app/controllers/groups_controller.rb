class GroupsController < ApplicationController

  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def create
    group_params = params.require(:group).permit(:name, :image)
    @group = current_user.groups.create(group_params)
    puts "CURRENT USER: #{current_user[:name]}, ID => #{current_user[:id]}"
    puts "Group: NAME => #{@group[:name]}, USER => #{@group[:user_id]}"
    if @group.save!
      redirect_to groups_path, :notice => "Created New Group!"
    else
      render "new"
    end
  end

  def show
    @group = Group.find(params[:id])
  end

end
