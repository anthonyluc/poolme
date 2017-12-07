class RolesController < ApplicationController
  before_action :set_role, only: :show

  def index
  end

  def show
  end

  private

  def set_role
    @role = Role.find(params[:id])
  end
end
