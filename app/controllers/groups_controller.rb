class GroupsController < ApplicationController
  def index
    @groups = Group.all
    @title = 'Groups'
  end

  def new
    @group = Group.new
    @title = 'New Group'
  end

  def create
    group_params = params.require(:group).permit(:name, :image)
    @group = current_user.groups.create(group_params)
    if @group.save!
      redirect_to groups_path, notice: 'Created New Group!'
    else
      render 'new'
    end
  end

  def show
    @group = Group.find(params[:id])
    @group_task = GroupTask.new
    @title = @group[:name]
  end

  def update
    @group = Group.find(params[:id])
    task_param = params.require(:task).permit(:task_id)
    @group_task = @group.group_tasks.create(group_id: @group[:id], task_id: task_param[:task_id])
    flash[:alert] = 'The task was not added' unless @group_task.save
    redirect_to @group
  end
end
