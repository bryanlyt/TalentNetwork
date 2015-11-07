class ProjectsController < ApplicationController
  load_and_authorize_resource except: [:index, :show]

  def index
    @projects = Project.preload(:creator)
  end

  def show
    find_project
  end

  def new
    @project = Project.new
  end

  def create
    @project =
      Project.new(project_params.merge(creator: current_user))
    if @project.save
      flash[:success] = t(:successfully_created, instance: @project)
      redirect_to @project
    else
      render :new
    end
  end

  def edit
    find_project
  end

  def update
    find_project
    if @project.update(project_params)
      flash[:success] = t(:successfully_updated, instance: @project)
      redirect_to @project
    else
      render :edit
    end
  end

  def destroy
    find_project
    @project.destroy
    flash[:success] = t(:successfully_destroyed, instance: @project)
    redirect_to projects_path
  end

  private

  def find_project
    @project = Project.find(params[:id])
    gon.project = @project
  end

  def project_params
    params
      .require(:project)
      .permit(:name, :description, :location)
  end
end
