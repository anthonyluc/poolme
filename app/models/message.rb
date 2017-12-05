class Message < ApplicationRecord
  belongs_to :user
  validates :content, presence: true

  validates :content, presence: true
end
