class Skill < ApplicationRecord
  has_many :user_skills
  has_many :role_skills
  has_many :users, through: :user_skills
  has_many :roles, through: :role_skills
end
