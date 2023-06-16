class UsersController < ApplicationController

  # Get /users
  def index
    #@users = User.all
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true).order(created_at: :asc)
  end

end
