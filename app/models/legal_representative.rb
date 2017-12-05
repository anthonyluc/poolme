class LegalRepresentative < ApplicationRecord
  belongs_to :company
  belongs_to :user

  has_many :review_users
  has_many :users, through: :review_users

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :description, presence: true
end
