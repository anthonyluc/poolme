class Cview::ProjectsController < ApplicationController
  before_action :require_legal_representative
  before_action :set_project, only: :show

  def index
    @projects = Project.where(company_id: @legal_representative.company_id)
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
    params.require('project').permit(:name, :description, :date_start, :date_end, :country, photos: [])
  end

  def require_legal_representative
    unless LegalRepresentative.exists?(user_id: current_user.id)
      redirect_to projects_path
    end
    @legal_representative = LegalRepresentative.where(user_id: current_user.id)[0]
  end

  def set_project
    @project = Project.find(params[:id])
  end
end
