class Cview::ModelsController < ApplicationController
  before_action :require_legal_representative
  before_action :set_role, only: [:index]
  before_action :set_project, only: [:index]

  def index
    vals = {gender: @role.gender, ethnicity: @role.ethnicity, skin_color: @role.skin_color, hair_color: @role.hair_color, haircut: @role.haircut, height: @role.height, weight: @role.weight, corpulence: @role.corpulence}
    vals.reject!{ |key, value| value.nil? }
    @models = User.where(vals)
  end

  private

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
