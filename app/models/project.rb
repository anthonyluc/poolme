class Project < ApplicationRecord
  belongs_to :company
  has_many :discussions
  has_many :review_projects
  has_many :roles
  has_many :models
  has_many :users, through: :review_projects
  has_many :users, through: :discussions
  has_many :role_skills, through: :roles
  geocoded_by :city
  after_validation :geocode, if: :city_changed?

  validates :name, presence: true
  validates :description, presence: true
  validates :date_start, presence: true
  validates :date_end, presence: true

  has_attachments :photos, maximum: 10
end

