class Movie < ApplicationRecord
  has_many :interactions, as: :interactable
  has_one_attached :qr_code
  has_one_attached :barcode
  has_many_attached :soundtracks
  has_many_attached :images

  enum access: { draft: 'draft', published: 'published', passcode_protected: 'passcode_protected' }

  scope :search_by_title, ->(title) { where('title ILIKE ?', "%#{title}%") }

  validates :title, presence: true
  validates :access, presence: true
  validates :passcode, presence: true, if: :passcode_protected?
  validates :images, attached: true,
                     content_type: ['image/png', 'image/jpg', 'image/jpeg'],
                     size: { less_than: 20.megabytes }
  validates :soundtracks, attached: true,
                          content_type: ['audio/mpeg', 'audio/mp3'],
                          size: { less_than: 20.megabytes }

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
