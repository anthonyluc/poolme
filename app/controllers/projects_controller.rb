class ProjectsController < ApplicationController
  before_action :set_models, only: :index
  def index
    @projects = []
    # @projects = policy_scope(Project)
    # @projects = Project.joins(:model).where('models.user_id = ?', current_user.id)
    @models.each do |m|
      @projects << {project: Project.find(m.project.id), role: Role.where(id: m.role.id, project: m.project.id)[0]}
    end
  end

  private

  def set_models
    @models = policy_scope(Model)
  end
end
