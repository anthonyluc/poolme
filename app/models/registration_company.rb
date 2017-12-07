class RegistrationCompany
  include ActiveModel::Model

  attr_accessor :first_name
  attr_accessor :last_name
  attr_accessor :grade
  attr_accessor :phone_number
  attr_accessor :name
  attr_accessor :country
  attr_accessor :photos

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :grade, presence: true
  validates :phone_number, presence: true
  validates :name, presence: true
  validates :country, presence: true

  has_attachments :photos, maximum: 2
end
