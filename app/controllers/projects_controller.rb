class ProjectsController < ApplicationController
  before_action :set_models, only: :index
  def index
    @projects = []
    @models.each do |m|
      @projects << {project: Project.find(m.project.id), role: Role.where(id: m.role.id, project: m.project.id)[0]}
    end
  end

  private

  def set_models
    @models = Model.where(user: current_user)
  end
end
