class Cview::RolesController < ApplicationController
  before_action :require_legal_representative
  before_action :set_role, only: [:show, :edit, :update]
  before_action :get_role, only: [:update_filter]
  before_action :set_project, only: [:show, :create, :edit, :update, :update_filter]
  before_action :set_filter_models, only: [:show, :update_filter]

  def index
    @roles = Role.where(company_id: @legal_representative.company_id)
  end

  def show
    if params[:discussion_id]
      redirect_to root_path
    else
      vals = {}
          unless @filter_models.gender.include?("all")
            vals[:gender] = @filter_models.gender
          end
          unless @filter_models.ethnicity.include?("all")
            vals[:ethnicity] =  @filter_models.ethnicity
          end
          unless @filter_models.hair_color.include?("all")
            vals[:hair_color] =  @filter_models.hair_color
          end
          unless @filter_models.haircut.include?("all")
            vals[:haircut] =  @filter_models.haircut
          end
          unless @filter_models.height == []
            vals[:height] =  @filter_models.height
          end
          unless @filter_models.corpulence.include?("all")
            vals[:corpulence] =  @filter_models.corpulence
          end
      @users = User.where(vals)
      @models = Model.where(role: @role).select(:user_id, :checked)
    end
  end

  def new
    @role = Role.new
  end

  def create
    @role = Role.new(role_params)
    @role.project = @project
    @filter_models = @role.filter_models.build()
    if @role.save
      @filter_models.update_attributes(filter_models_params)
      redirect_to cview_project_path(@project)
    else
      render :new
    end
  end

  def edit
  end


  def update
    @role.update_attributes(role_params)
    redirect_to cview_project_path(@project)
  end

  def update_filter
    @filter_models.update_attributes(filter_models_update_params)
    redirect_to cview_project_role_path(@project, @role)
  end

  def destroy
  end

  private

  def role_params
    params.require(:role).permit(:name, :description, :date_start, :date_end, :income, :hours, :gender, :ethnicity, :skin_color, :hair_color, :haircut, :height, :weight, :corpulence, photos: [])
  end

  def filter_models_params
    filter = params.require(:role).permit(:gender, :ethnicity, :hair_color, :haircut, :height, :corpulence)
    filter.to_h.transform_values {|v| v.blank? ? [] : Array(v)}
  end

  def filter_models_update_params
    params.require(:filter_model).permit(gender: [], ethnicity: [], hair_color: [], haircut: [], height: [], corpulence: [])
  end

  def require_legal_representative
    unless Company.exists?(id: current_user.company_id)
      redirect_to projects_path
    end
  #  @legal_representative = current_user
  end

  def set_role
    @role = Role.find(params[:id])
  end

  def get_role
    @role = Role.find(params[:role_id])
  end

  def set_project
    if params[:discussion_id]
      @project = Project.find(params[:id])
    else
      @project = Project.find(params[:project_id])
    end
  end

  def set_filter_models
    @filter_models = FilterModel.where(role: @role)[0]
  end
end
