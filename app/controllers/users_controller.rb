class UsersController < ApplicationController
  include Pagy::Backend

  # Get /users
  def index
    #@users = User.all
    search_params = params.permit(:format, :page, q: [:first_name_or_last_name_or_email_cont])
    @q = User.ransack(search_params[:q])
    users = @q.result(distinct: true).order(created_at: :asc)
    @pagy, @users = pagy_countless(users, items: 2)
    #@users = @q.result(distinct: true).order(created_at: :asc)
  end

end
