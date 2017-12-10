class Model < ApplicationRecord
  belongs_to :project
  belongs_to :role
  belongs_to :user
end
