class ProjectPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.joins(:models).where('models.user_id = ?', user.id)
      # scope.joins(:model).where(user: user)
      # Model.where(user: current_user)
    end
  end
end
