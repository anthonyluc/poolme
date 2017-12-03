class LegalRepresentative < ApplicationRecord
  belongs_to :company
  belongs_to :user

  has_many :review_users
  has_many :users, through: :review_users
end
