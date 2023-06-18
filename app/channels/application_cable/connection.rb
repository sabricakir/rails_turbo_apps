# app/channels/application_cable/connection.rb
module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user, :session_user

    def connect
      self.current_user = find_verified_user
      self.session_user = find_session_user
    end

    private
    def find_verified_user
      if verified_user = Session.find_by(id: cookies.signed[:session_token])&.user
        verified_user
      else
        reject_unauthorized_connection
      end
    end

    def find_session_user
      request.session.id
    end
  end
end
