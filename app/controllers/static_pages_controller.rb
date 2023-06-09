class StaticPagesController < ApplicationController
  def home
  end
  # keep track user online
  def dashboard
    users_online = Kredis.unique_list("users_online").elements
    @users = User.where(id: users_online)
  end
end
