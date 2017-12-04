class RoleSkill < ApplicationRecord
  belongs_to :skill
  belongs_to :role
end
