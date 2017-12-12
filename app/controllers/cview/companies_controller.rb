class Cview::CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :destroy, :edit, :update]
  before_action :require_legal_representative

  def show
    @legal_representatives = User.where(company_id: @company.id)
  end

  def update
    current_user.update_attributes(user_params[:users_attributes]['0'])
    @company.update_attributes(company_params)
    if @company.update(company_params)
      redirect_to company_path(@company)
    else
      redirect_to edit_cview_company_path(@company)
    end
  end

  def destroy
  end

  private

  def user_params
    params.require(:company).permit(users_attributes: [:first_name, :last_name, :grade_company, :phone_number_pro, :email_pro, :description_pro])
  end

  def company_params
    params.require(:company).permit(:name, :country, :description, :address, :phone_numer, :email, :website, photos: [])
  end

  def require_legal_representative
    unless @company.id == current_user.company_id
      redirect_to projects_path
    end
   # @legal_representative = current_user
  end

  def set_company
    # @company = Company.find(params[:id])
    @company = Company.find(current_user.company_id)
  end
end
