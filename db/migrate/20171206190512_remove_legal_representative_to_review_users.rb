class RemoveLegalRepresentativeToReviewUsers < ActiveRecord::Migration[5.1]
  def change
    remove_reference :review_users, :legal_representative, index: true, foreign_key: true
  end
end
