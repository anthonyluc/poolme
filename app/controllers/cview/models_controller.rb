class Cview::ModelsController < ApplicationController
  before_action :require_legal_representative
  before_action :set_role, only: [:index]
  before_action :set_user, only: [:create]
  before_action :get_role, only: [:create, :update]
  before_action :set_project, only: [:index, :create, :update]

  def index
    vals = {gender: @role.gender, ethnicity: @role.ethnicity, hair_color: @role.hair_color, haircut: @role.haircut, height: @role.height, weight: @role.weight, corpulence: @role.corpulence}
    #vals.reject!{ |key, value| value.nil? }
    vals.reject!{ |key, value| value.nil? }
    # @users = User.search(vals, hitsPerPage: 2)
    @users = User.where(vals)
  end

  def create
    @model = Model.new(project: @project, role: @role, user: @user, checked: true)
    @model.save!
    @discussion_id = "#{@project.company.name} #{@project.name} #{@user.username}".gsub(/\W/,'-')
    @discussion = Discussion.new(name: "#{@project.name}", discussion_id: @discussion_id, user_id: current_user.id, project_id: @project.id)
    @discussion.save!
    @discussion = Discussion.new(name: "#{@project.name}", discussion_id: @discussion_id, user_id: @user.id, project_id: @project.id)
    @discussion.save!
    @message = Message.new(content: "Hi #{@user.username}, we want you !", discussion_id: @discussion_id, user_id: current_user.id)
    @message.save!
    redirect_back(fallback_location: root_path)
  end

  def update
    @model = Model.where(role_id: params[:role_id], user_id: params[:id])[0]
    @model.toggle(:checked)
    @model.save
    redirect_back(fallback_location: root_path)
    #redirect_to cview_project_role_path(project_id: @project, id: @role)
  end

  private

  def require_legal_representative
    unless Company.exists?(id: current_user.company_id)
      redirect_to projects_path
    end
   # @legal_representative = current_user
  end

  def set_user
    @user = User.find(params[:id])
  end

  def set_role
    @role = Role.find(params[:id])
  end

  def get_role
    @role = Role.find(params[:role_id])
  end

  def set_project
    @project = Project.find(params[:project_id])
  end
end
