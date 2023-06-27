class Movie < ApplicationRecord
  scope :search_by_title, -> (title) { where("title ILIKE ?", "%#{title}%") }
end
