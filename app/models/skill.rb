class Skill < ApplicationRecord
  has_many :user_skills
  has_many :model_skills
  has_many :users, through: :user_skills
  has_many :models, through: :model_skills
end
