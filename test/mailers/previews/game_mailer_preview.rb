# Preview all emails at http://localhost:3000/rails/mailers/game_mailer
class GameMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/game_mailer/invite
  def invite
    GameMailer.with(game: Game.first).invite
  end

end
