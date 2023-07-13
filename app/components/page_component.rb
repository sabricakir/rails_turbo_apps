# frozen_string_literal: true

class PageComponent < ViewComponent::Base
  attr_reader :icon, :title, :subtitle, :full_width

  renders_one :header

  def initialize(icon:, title:, subtitle:, full_width: false )
    @icon = icon
    @title = title
    @subtitle = subtitle
    @full_width = full_width
  end

  def full_width_class
    full_width ? 'w-full' : 'mx-auto max-w-lg'
  end
end
