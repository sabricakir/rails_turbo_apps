class CookiesController < ActionController::Base
  def index
    session[:cookies_accepted] = params[:cookies_accepted]
  end
end
