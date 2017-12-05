class Role < ApplicationRecord
  belongs_to :project
  has_many :pools
  has_many :users, through: :pools
  has_many :role_skills, , dependent: :destroy
  has_many :skills, through: :role_skills

  validates :name, presence: true
  validates :description, presence: true
  validates :date_start, presence: true
  validates :date_end, presence: true
  validates :income, presence: true
end
