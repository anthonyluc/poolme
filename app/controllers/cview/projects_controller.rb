class Cview::ProjectsController < ApplicationController
  before_action :require_legal_representative
  before_action :set_project, only: :show

  def index
    @projects = Project.all
  end

  def show
    @roles = Role.where(project: @project)
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.company_id = @legal_representative.company_id
    if @project.save
      redirect_to cview_project_path(@project)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def project_params
    params.require('project').permit(:name, :description, :date_start, :date_end, :city, :country, photos: [])
  end

  def require_legal_representative
    unless Company.exists?(id: current_user.company_id)
      redirect_to projects_path
    end
   # @legal_representative = current_user
  end

  def set_project
    @project = Project.find(params[:id])
  end
end
