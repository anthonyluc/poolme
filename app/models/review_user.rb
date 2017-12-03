class ReviewUser < ApplicationRecord
  belongs_to :legal_representative
  belongs_to :user
end
