class Project < ApplicationRecord
  belongs_to :company
  has_many :discussions
  has_many :review_projects
  has_many :models
  has_many :pools, through: :models
  has_many :users, through: :review_projects
  has_many :users, through: :discussions
  has_many :model_skills, through: :models
end
