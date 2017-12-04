class Role < ApplicationRecord
  belongs_to :project
  has_many :pools
  has_many :users, through: :pools
  has_many :role_skills
  has_many :skills, through: :role_skills
end
