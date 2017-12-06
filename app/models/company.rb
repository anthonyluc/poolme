class Company < ApplicationRecord
  has_many :users
  has_many :projects

  has_many :review_projects, through: :projects, dependent: :destroy
  has_many :discussions, through: :projects
  has_many :roles, through: :projects
  has_many :models, through: :roles

  validates :name, uniqueness: true, presence: true

  has_attachments :photos, maximum: 1
  accepts_nested_attributes_for :users
end
