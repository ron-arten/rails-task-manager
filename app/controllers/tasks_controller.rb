class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def find
  end

  def new
    @task = Task.new
  end

  def show
    @task = Task.find(params[:id])
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to tasks_path

  end

  def update
    @task = Task.find(params[:id])
    @task.update(params[:task])
  end

  def destroy
    @task = Task.destroy(params[:id])
    redirect_to tasks_path
  end

  private
  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

end
