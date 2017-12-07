class Role < ApplicationRecord
  belongs_to :project
  has_many :models
  has_many :users, through: :models
  has_many :role_skills, dependent: :destroy
  has_many :skills, through: :role_skills

  validates :name, presence: true
  validates :description, presence: true
  validates :date_start, presence: true
  validates :date_end, presence: true
  validates :hours, presence: true
  validates :income, presence: true
end
