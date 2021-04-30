class TasksController < ApplicationController
  def index
    puts "EXTERNAL: #{params[:external]}"

    external = params[:external]

    @tasks = if external == 'true'
               Task.where(user_id: current_user).select { |task| task.groups.empty? }
             else
               Task.where(user_id: current_user)
             end

    @tasks
  end

  def new
    @task = Task.new
    @groups = Group.all
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
