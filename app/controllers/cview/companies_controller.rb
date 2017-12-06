class Cview::CompaniesController < ApplicationController
  before_action :set_company
  before_action :require_legal_representative

  def show
    @legal_representatives = User.where(company: @company)
  end

  def update
    current_user.update_attributes(user_params[:users_attributes]['0'])
    @company.update_attributes(company_params)
    redirect_to edit_cview_company_path(@company)
  end

  def destroy
  end

  private

  def user_params
    params.require(:company).permit(users_attributes: [:first_name, :last_name, :grade_company, :phone_number_pro, :email_pro, :description_pro])
  end

  def company_params
    params.require(:company).permit(:name, :country, photos: [])
  end

  def require_legal_representative
    unless @company == current_user.company
      redirect_to projects_path
    end
    @legal_representative = current_user
  end

  def set_company
    @company = Company.find(params[:id])
  end
end
