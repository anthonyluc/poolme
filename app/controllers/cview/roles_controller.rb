class Cview::RolesController < ApplicationController
  before_action :require_legal_representative
  before_action :set_role, only: [:show, :edit, :update]
  before_action :set_project, only: [:show, :create, :edit, :update]

  def index
    @roles = Role.where(company_id: @legal_representative.company_id)
  end

  def show
  end

  def new
    @role = Role.new
  end

  def create
    @role = Role.new(role_params)
    @role.project = @project
    if @role.save
      redirect_to cview_project_role_path(project_id: @project, id: @role)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @role.update_attributes(role_params)
    redirect_to cview_project_role_path(project_id: @project, id: @role)
  end

  def destroy
  end

  private

  def role_params
    params.require(:role).permit(:name, :description, :date_start, :date_end, :income, :hours, :gender, :ethnicity, :skin_color, :hair_color, :haircut, :height, :weight, :corpulence, photos: [])
  end

  def require_legal_representative
    unless Company.exists?(id: current_user.company_id)
      redirect_to projects_path
    end
    @legal_representative = current_user
  end

  def set_role
    @role = Role.find(params[:id])
  end
  def set_project
    @project = Project.find(params[:project_id])
  end
end
