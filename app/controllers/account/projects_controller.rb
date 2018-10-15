class Account::ProjectsController < ApplicationController
  before_action :find_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.all
  end

  def show
    @tasks = @project.tasks
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.save
    redirect_to account_projects_path(@project)
  end

  def edit
   
  end

  def update
    @project.update(project_params)
    redirect_to account_projects_path(@project)
  end

  def destroy
    @project.destroy
    redirect_to account_projects_path(@project)
  end

  private

  def find_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name)
  end
end

