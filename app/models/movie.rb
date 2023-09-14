class Movie < ApplicationRecord
  has_many :interactions, as: :interactable
  has_one_attached :qr_code

  enum access: { draft: 'draft', published: 'published', passcode_protected: 'passcode_protected' }

  scope :search_by_title, ->(title) { where('title ILIKE ?', "%#{title}%") }

  validates :title, presence: true
  validates :access, presence: true
  validates :passcode, presence: true, if: :passcode_protected?

  after_create :generate_qr_code

  def generate_qr_code
    Movies::GenerateQr.new(self).call
  end
end
