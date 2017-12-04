class Project < ApplicationRecord
  belongs_to :company
  has_many :discussions
  has_many :review_projects
  has_many :roles
  has_many :pools, through: :roles
  has_many :users, through: :review_projects
  has_many :users, through: :discussions
  has_many :role_skills, through: :roles
end
