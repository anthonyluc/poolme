class Cview::RolesController < ApplicationController
  before_action :require_legal_representative
  before_action :set_params, only: :show

  def index
    @roles = Role.where(company_id: @legal_representative.company_id)
  end

  def new
    @role = Role.new
  end

  def create
    @role = Role.new(role_params)
    @role.project_id = @legal_representative.company_id
    if @role.save
      redirect_to cview_project_path(@role)
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

  def role_params
    params.require(:role).permit(:name, :description, :date_start, :date_end, :country, photos: [])
  end

  def require_legal_representative
    unless Company.exists?(id: current_user.company_id)
      redirect_to projects_path
    end
    @legal_representative = current_user
  end

  def set_params
    @role = Role.find(params[:id])
    @project = Project.find(params[:project_id])
  end
end
