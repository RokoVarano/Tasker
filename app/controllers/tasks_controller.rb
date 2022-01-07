class TasksController < ApplicationController
  def index
    @tasks = Task.external(params[:external], current_user[:id])
    @title = 'Tasks'
    @tasks
  end

  def new
    @task = Task.new
    @groups = Group.all
    @title = 'New Task'
  end

  def create
    task_params = params.require(:task).permit(:name, :points, :group)
    @task = current_user.tasks.create(task_params)

    if @task.save!

      unless params[:group].empty?
        @grouptask = @task.group_tasks.create(group_id: params[:group][:group_id])
        @grouptask.save
      end

      redirect_to tasks_path, notice: 'Created New Task!'
    else
      render 'new'
    end
  end
end
