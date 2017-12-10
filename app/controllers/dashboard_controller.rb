class DashboardController < ApplicationController
  before_action :set_project, only: [:show, :message, :agreed]
  before_action :set_model, only: [:show, :message, :agreed]
  before_action :set_role, only: [:show, :message]
  before_action :set_discussion, only: [:show, :message]
  before_action :set_messages, only: [:show, :message]

  def show
    @message = Message.new
  end

  def message
     @message = Message.new(content: message_params[:content], discussion_id: @discussion.discussion_id, user:current_user)
    if @message.save
      redirect_to project_user_dashboard_path(@project)
    else
      render :show
    end
  end

  def agreed
    @model.toggle(:agreed)
    @model.save
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_model
    @model = Model.where(project: @project, user: current_user)[0]
  end

  def set_role
    @role = Role.find(@model.role_id)
  end

  def set_discussion
    @discussion = Discussion.where(project: @project, user: current_user)[0]
  end

  def set_messages
    @messages = Message.where(discussion_id: @discussion.discussion_id)
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
