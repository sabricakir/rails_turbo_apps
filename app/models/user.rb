class User < ApplicationRecord
  has_secure_password

  enum status: { active: 'active', inactive: 'inactive' }

  kredis_unique_list :recently_viewed_products, limit: 5

  has_many :email_verification_tokens, dependent: :destroy
  has_many :password_reset_tokens, dependent: :destroy
  has_many :sessions, dependent: :destroy

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  before_validation if: -> { email.present? } do
    self.email = email.downcase.strip
  end

  before_validation if: :email_changed?, on: :update do
    self.verified = false
  end

  after_update if: :password_digest_previously_changed? do
    sessions.where.not(id: Current.session).delete_all
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[first_name last_name email]
  end

  def self.ransackable_attributes(_auth_object = nil)
    %w[first_name last_name email]
  end
end
