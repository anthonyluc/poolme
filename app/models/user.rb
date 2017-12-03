class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :messages
  has_many :discussions
  has_many :review_users
  has_many :legal_representatives
  has_many :companies, through: :legal_representatives
  has_many :user_skills
  has_many :skills, through: :user_skill
  has_many :pools
  has_many :models, through: :pools
  has_many :projects, through: :models
  has_many :projects, through: :discussions
end
