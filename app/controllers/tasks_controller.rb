class TasksController < ApplicationController
  def index
    @tasks = Task.all.order(:deadline)

    if params[:status] == "upcoming"
      @tasks = @tasks.where("deadline > ?", Time.now)
    elsif params[:status] == "completed"
      @tasks = @tasks.where(completed: true)
    end

  # Clear the close deadline notification after marking a task as completed
  flash.delete(:close_deadline)
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

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])

    if @task.update(task_params)
      redirect_to tasks_path, notice: "Task updated successfully."
    else
      render :edit
    end
  end

  def complete
    @task = Task.find(params[:id])
    @task.update(completed: true)

    flash.clear
    flash[:notice] = "Task marked as completed!"

    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :deadline, :completed)
  end
end
