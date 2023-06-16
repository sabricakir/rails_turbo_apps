class UsersController < ApplicationController

  # Get /users
  def index
    @users = User.all
  end

end
