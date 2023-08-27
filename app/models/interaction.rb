class Interaction < ApplicationRecord
  belongs_to :interactable, polymorphic: true
  belongs_to :user
end
