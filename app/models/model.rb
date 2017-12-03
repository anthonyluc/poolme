class Model < ApplicationRecord
  belongs_to :project
  has_many :pools
  has_many :users, through: :pools
  has_many :model_skills
  has_many :skills, through: :model_skills
end
