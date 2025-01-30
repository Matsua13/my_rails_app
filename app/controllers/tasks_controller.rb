class TasksController < ApplicationController
  def index
    @tasks = Task.all.order(:deadline)
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path, notice: "Task added, let's do it!"
    else
      render :new
    end
  end

  def complete
    @task = Task.find(params[:id])
    @task.update(completed: true)
    redirect_to tasks_path, notice: "Tâche complétée !"
  end

  private

  def task_params
    params.require(:task).permit(:title, :deadline)
  end
end
