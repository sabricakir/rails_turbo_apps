class ApiToken < ApplicationRecord
  before_validation :create_token

  private

  def create_token
    self.token = SecureRandom.hex(32) if token.blank?
  end
end
