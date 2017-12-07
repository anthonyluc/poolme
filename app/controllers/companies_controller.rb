class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]

  def index
    @companies = Company.all
  end

  def show
    @legal_representatives = User.where(company_id: @company.id)
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params[:companies_attributes]['0'])
    if @company.save
      current_user.company_id = @company.id
      if current_user.update_attributes(user_params)
        redirect_to company_path(@company)
      else
        render :new
      end
    else
      render :new
    end
  end

  def edit
    @legal_representatives = User.where(company: @company)
  end

  def update
    @company.update_attributes(company_params)
    redirect_to company_path(@company)
  end

  def destroy
    @company.destroy
    redirect_to projects_path
  end

  private

  def set_company
    @company = Company.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :grade_company, :phone_number_pro, :email_pro, :description_pro)
  end

  def company_params
    params.require(:user).permit(companies_attributes: [:name, :country, photos: []])
  end
end
