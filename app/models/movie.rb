class Movie < ApplicationRecord
  enum access: { draft: 'draft', published: 'published', passcode_protected: 'passcode_protected' }

  scope :search_by_title, ->(title) { where('title ILIKE ?', "%#{title}%") }

  validates :title, presence: true
  validates :access, presence: true
  validates :passcode, presence: true, if: :passcode_protected?
end
