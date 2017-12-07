class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :companies
  has_many :messages
  has_many :discussions
  has_many :review_users
  has_many :user_skills, dependent: :destroy
  has_many :skills, through: :user_skill
  has_many :models
  has_many :roles, through: :models
  has_many :projects, through: :roles
  has_many :projects, through: :discussions

  validates :username, uniqueness: true, presence: true
  accepts_nested_attributes_for :companies
end
