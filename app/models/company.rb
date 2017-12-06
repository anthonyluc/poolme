class Company < ApplicationRecord
  has_many :legal_representatives
  has_many :projects

  has_many :review_users, through: :legal_representatives
  has_many :review_projects, through: :projects, dependent: :destroy
  has_many :discussions, through: :projects
  has_many :roles, through: :projects
  has_many :models, through: :roles

  validates :name, uniqueness: true, presence: true

  has_attachments :photos, maximum: 2
end
