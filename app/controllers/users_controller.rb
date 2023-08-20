class UsersController < ApplicationController
  include Pagy::Backend

  # Get /users
  def index
    # @users = User.all
    search_params = params.permit(:format, :page, q: [:first_name_or_last_name_or_email_cont])
    @q = User.ransack(search_params[:q])
    users = @q.result(distinct: true).order(created_at: :asc)
    @pagy, @users = pagy_countless(users, items: 2)
    # @users = @q.result(distinct: true).order(created_at: :asc)
  end

  def bulk_update
    @selected_users = User.where(id: params.fetch(:user_ids, []).compact)
    @selected_users.update_all(status: :inactive) if params[:commit] == 'inactive'
    @selected_users.update_all(status: :active) if params[:commit] == 'active'
    redirect_to action: :index
  end
end
