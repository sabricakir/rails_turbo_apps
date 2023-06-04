class GameMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.game_mailer.invite.subject
  #
  def invite
    @game = params[:game]
    calendar_event = Games::IcalendarEvent.new(game: @game).call
    attachments['invite.ics'] = calendar_event
    mail to: "test@gmail.com", subject: "You have invited to #{@game.title}" # invoke current_user in here
  end
end
