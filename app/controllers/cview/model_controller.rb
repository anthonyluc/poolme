class Cview::ModelController < ApplicationController
  before_action :require_legal_representative
  before_action :set_role, only: [:show, :create, :accept]
  before_action :set_project, only: [:show, :create, :accept]
  before_action :set_model, only: [:show, :create, :accept]
  before_action :set_discussion, only: [:show, :create]


  def show
    @messages = Message.where(discussion_id: @discussion.discussion_id)
    @message = Message.new
  end

  def create
    @message = Message.new(content: message_params[:content], discussion_id: @discussion.discussion_id, user:current_user)
    if @message.save
      redirect_to cview_discussion_role_model_path(@project, @role, params[:id])
    else
      @messages = Message.where(discussion_id: @discussion.discussion_id)
      render :show
    end
  end

  def accept
    if @agreed
      @role.update_attributes(selected_user_id: @model.id)
    end
  end

  private

  def require_legal_representative
    unless Company.exists?(id: current_user.company_id)
      redirect_to projects_path
    end
  #  @legal_representative = current_user
  end

  def set_model
    @model = User.find(params[:id])
    @agreed = Model.where(project: @project, user: @model).first.agreed
  end

  def set_role
    @role = Role.find(params[:role_id])
  end

  def set_project
    # @project = Project.find(params[:discussion_project_id])
    @project = Project.find(@role.project_id)
  end

  def set_discussion
    @discussion = Discussion.where(project: @project, user: @model)[0]
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
