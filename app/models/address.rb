class Address < ApplicationRecord
  validates :country, presence: true
  validates :state, inclusion: { in: -> (address) { address.states.keys }, allow_blank: true }
  validates :state, presence: { if: -> (address) { address.states.present? }}
  validates :city, inclusion: { in: -> (address) { address.cities }, allow_blank: true }
  validates :city, presence: { if: -> (address) { address.cities.present? }}
  validates :details, presence: true
  def countries
    CS.countries
  end

  def states
    CS.states(country).with_indifferent_access
  end

  def cities
    CS.cities(state, country) || []
  end
end
