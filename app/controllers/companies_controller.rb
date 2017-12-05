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

    if @company.save
      redirect_to company_path(@company)
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
    params.require(:registration).permit(:grade, :email, :telephone)
  end
end
