class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]

  def index
    @companies = Company.all
  end

  def show
  end

  def new
    @registration_company = RegistrationCompany.new
  end

  def create
    @registration_company = RegistrationCompany.new(registration_company_params)
    @company = Company.new
    @legal_representative = LegalRepresentative.new
    @company.name = @registration_company.name
    @company.country = @registration_company.country
    @legal_representative.grade = @registration_company.grade
    @legal_representative.phone_number = @registration_company.phone_number
    current_user.first_name = @registration_company.first_name
    current_user.last_name = @registration_company.last_name
    current_user.save
    if @company.save
      @legal_representative.company = @company
      @legal_representative.user = current_user
      if @legal_representative.save
        redirect_to company_path(@company)
      else
        render :new
      end
    else
      render :new
    end
  end

  def edit
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

  def company_params
    params.require(:company).permit(:name, :address, :country, :email, :phone_number, :website, photos: [])
  end

  def registration_company_params
    params.require(:registration_company).permit(:first_name, :last_name, :grade, :phone_number, :name, :country)
  end
end
