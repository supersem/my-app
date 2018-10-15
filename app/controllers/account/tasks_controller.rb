class Account::TasksController < ApplicationController
  before_action :find_project
  before_action :find_task, only: [:show, :edit, :update, :destroy]

  def show
    @tasks = @project.tasks
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.project_id = @project.id
    @task.save
    redirect_to account_project_path(@project)
  end

  def edit
    
  end

  def update
    @task.update(task_params)
    redirect_to account_project_task_path(@project, @task)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to account_project_path(@project)
  end

  private

  def find_project
    @project = Project.find(params[:project_id])
  end

  def find_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name, :description)
  end
end

