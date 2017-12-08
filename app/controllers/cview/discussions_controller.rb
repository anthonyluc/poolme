class Cview::DiscussionsController < ApplicationController
  before_action :require_legal_representative
  before_action :set_discussion, only: :show

  def index
    @projects = Project.where(company_id: current_user.company_id)
    @discussions = []
    @projects.each { |p|
      @discussions << Discussion.where(project_id: p.id)[0]
    }
  end

  def show
    @roles = Role.where(project_id: @discussion.project_id)
  end

  def new
    @discussion = Discussion.new
  end

  # def create
  #   @discussion = Discussion.new(discussion_params)
  #   if @projec.save
  #     redirect_to cview_project_path(@project)
  #   else
  #     render :new
  #   end
  # end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def discussion_params
    params.require(:discussion).permit(:name)
  end

  def require_legal_representative
    unless Company.exists?(id: current_user.company_id)
      redirect_to projects_path
    end
    @legal_representative = current_user
  end

  def set_discussion
    @discussion = Discussion.find(params[:id])
  end
end
