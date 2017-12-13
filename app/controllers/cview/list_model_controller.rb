class Cview::ListModelController < ApplicationController
  before_action :require_legal_representative
  before_action :set_project, only: :index
  before_action :set_discussion, only: :index
  before_action :set_role, only: :index

  def index
    @models = Model.where(project: @project, role: @role)
    @discussions = []
    @models.each { |m|
      discussion = Discussion.where(project: @project, user: m.user)[0]
      if discussion != nil
        user = m.user.slice(:id, :username)
        last_message = Message.where(discussion_id: discussion.discussion_id).select(:id, :user_id, :content, :created_at).last
        last_message_user = last_message.user.username
        @discussions << {
          discussion: discussion,
          user: user,
          last_message_user: last_message_user,
          last_message: last_message
        }
      end
    }
  end

  private

  def require_legal_representative
    unless Company.exists?(id: current_user.company_id)
      redirect_to projects_path
    end
   # @legal_representative = current_user
  end

  def set_project
    @project = Project.where(id: params[:discussion_project_id], company_id: current_user.company_id)
  end

  def set_discussion
    @discussion = Discussion.where(project: @project).first
  end

  def set_role
    @role = Role.find(params[:role_id])
  end
end
