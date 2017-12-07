class RolesController < ApplicationController
  def index
  end

  def show
  end

  private

  def set_role
    @role = Role.find(params[:id])
  end
end
