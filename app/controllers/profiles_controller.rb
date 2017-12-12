class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update]

  def update
    @profile.update_attributes(profile_params)
    authorize @profile
    redirect_to profile_path(@profile)
  end

  private

  def set_profile
    @profile = User.find(params[:id])
    authorize @profile
  end

  def profile_params
    params.require(:user).permit(:first_name, :last_name, :phone_number, :description, :address, :city, :country, :newsletter, :model, :gender, :ethnicity, :skin_color, :hair_color, :haircut, :height, :weight, :corpulence, photos: [])
  end

  def profile_pro_params
    params.require(:user).permit(:phone_number_pro, :email_pro, :grade_company, :description_pro)
  end
end
