class TasksController < ApplicationController
  def index
    @tasks = Task.where(user_id: current_user)
  end

  def new
    @task = Task.new
  end

  def create
    task_params = params.require(:task).permit(:name, :points)
    @task = current_user.tasks.create(task_params)
    puts "CURRENT USER: #{current_user[:name]}, ID => #{current_user[:id]}"
    puts "Task: NAME => #{@task[:name]}, POINTS => #{@task[:points]}, USER => #{@task[:user_id]}"
    if @task.save!
      redirect_to tasks_path, :notice => "Created New Task!"
    else
      render "new"
    end
  end
end
