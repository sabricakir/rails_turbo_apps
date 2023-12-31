class Games::IcalendarEvent
  require 'icalendar'

  def initialize(game:)
    @game = game
  end

  def call
    # Create a calendar with an event (standard method)
    cal = Icalendar::Calendar.new
    cal.event do |e|
      e.dtstart     = @game.starts_at
      e.dtend       = @game.ends_at
      e.summary     = @game.title
      e.description = @game.description
      e.ip_class    = "PUBLIC"
      e.location    = @game.address
      e.url         = Rails.application.routes.url_helpers.game_url(@game)
      e.uid         = "game_#{@game.id}"
      e.sequence    = Time.now.to_i
      e.organizer   = Icalendar::Values::CalAddress.new("mailto:#{ApplicationMailer.default[:from]}", cn: "Sabri Cakir")
      e.attendee    = Icalendar::Values::CalAddress.new("mailto: test@gmail.com") #partstat: 'accepted') # invoke current_user in here
    end
    cal.publish
    cal.ip_method = "REQUEST"
    cal.to_ical
  end
end