class Interaction < ApplicationRecord
  INTERACTION_TYPES = %w[like bookmark watchlist].freeze

  belongs_to :interactable, polymorphic: true
  belongs_to :user
end
