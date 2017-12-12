class RolePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def show?
    record.user_ids.include?(user.id)
  end
end
