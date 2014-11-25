class TasksController < ApplicationController
  before_action :find_task, only: [:show, :edit, :update]
  def index
    # Should display a list of all tasks and, for each task: - a link to its show view
    # (use a link_to helper) - a link to its edit view - a link to its delete action.
    @tasks = Task.all
  end

  def show
  end

  def new
    # get un formulaire avec les infos
    @task = Task.new
  end

  def create
    # Post the parameter to create a new restaurant
    Task.create(task_params)
    redirect_to tasks_path
  end

  def edit
  end

  def update
    @task.update(task_params)
    redirect_to task_path @task
  end

  def destroy
    Task.find(params[:id]).destroy
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, :status)
  end

  def find_task
    @task = Task.find(params[:id])
  end
end
