class Movie < ApplicationRecord
  has_many :interactions, as: :interactable
  has_one_attached :qr_code
  has_one_attached :barcode
  has_many_attached :soundtracks

  enum access: { draft: 'draft', published: 'published', passcode_protected: 'passcode_protected' }

  scope :search_by_title, ->(title) { where('title ILIKE ?', "%#{title}%") }

  validates :title, presence: true
  validates :access, presence: true
  validates :passcode, presence: true, if: :passcode_protected?

  after_create :generate_qr_code
  after_create :generate_barcode

  private

  def generate_qr_code
    Movies::GenerateQr.new(self).call
  end

  def generate_barcode
    Movies::GenerateBarcode.new(self).call
  end
end
