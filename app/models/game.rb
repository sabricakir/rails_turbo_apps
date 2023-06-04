class Game < ApplicationRecord
  EDITABLE_ATTRIBUTES = %i[title description starts_at ends_at].freeze

  validates :title, :description, :starts_at, :ends_at, presence: true
end
