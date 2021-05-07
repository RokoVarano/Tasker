class TasksController < ApplicationController
  def index
    external = params[:external]

    @tasks = if external == 'true'
               Task.where(user_id: current_user).order(:created_at).select { |task| task.groups.empty? }
             else
               Task.where(user_id: current_user).order(:created_at)
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
    puts "CURRENT USER: #{current_user[:name]}, ID => #{current_user[:id]}"
    puts "Task: NAME => #{@task[:name]}, POINTS => #{@task[:points]}, USER => #{@task[:user_id]}"
    if @task.save!
      redirect_to tasks_path, notice: 'Created New Task!'
    else
      render 'new'
    end
  end
end
