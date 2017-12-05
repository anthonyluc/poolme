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
  has_many :user_skills, dependent: :destroy
  has_many :skills, through: :user_skill
  has_many :pools
  has_many :roles, through: :pools
  has_many :projects, through: :roles
  has_many :projects, through: :discussions

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone_number, presence: true
  validates :description, presence: true
  validates :username, presence: true
  validates :address, presence: true
  validates :gender, presence: true
  validates :name, presence: true
  validates :ethnicity, presence: true
  validates :skin_color, presence: true
  validates :hair_color, presence: true
  validates :haircut, presence: true
  validates :height, presence: true
  validates :weight, presence: true
  validates :corpulence, presence: true
end
