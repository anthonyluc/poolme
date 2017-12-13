class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]
  # after_create :send_welcome_email

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
  has_attachments :photos, maximum: 10

  private

  # include AlgoliaSearch

  # algoliasearch do
  #   attribute :city, :gender, :date_of_birth, :ethnicity, :hair_color, :haircut, :height, :corpulence
  # end


  def self.find_for_facebook_oauth(auth)
    user_params = auth.slice(:provider, :uid)
    user_params.merge! auth.info.slice(:email, :first_name, :last_name)
    user_params[:facebook_picture_url] = auth.info.image
    user_params[:token] = auth.credentials.token
    user_params[:token_expiry] = Time.at(auth.credentials.expires_at)
    user_params = user_params.to_h

    user = User.find_by(provider: auth.provider, uid: auth.uid)
    user ||= User.find_by(email: auth.info.email) # User did a regular sign up in the past.
    if user
      user.update(user_params)
    else
      user = User.new(user_params)
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.save
    end

    return user
  end

  def send_welcome_email
    UserMailer.welcome(self).deliver_now
  end
end
