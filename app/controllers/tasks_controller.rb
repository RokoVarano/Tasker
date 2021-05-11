class TasksController < ApplicationController
  def index
    external = params[:external]

    @tasks = if external == 'true'
               Task.where(user_id: current_user).select { |task| task.groups.empty? }
             else
               Task.where(user_id: current_user)
             end

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
        puts "EL UNLESS DEL GROUPTASK: #{params[:group][:group_id]}"
        @grouptask = @task.group_tasks.create(:group_id => params[:group][:group_id])
        @grouptask.save
      end

      redirect_to tasks_path, notice: 'Created New Task!'
    else
      render 'new'
    end
  end
end
