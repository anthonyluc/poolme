class ProjectsController < ApplicationController
  def index
    @projects = Project.where()
  end

  def create
  end

  def new
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end
end
