class ErrorsController < ActionController::Base
  def internal_server_error
    render status: :internal_server_error
  end

  def not_found
    render status: :not_found
  end

  def does_not_exist
    render status: :not_found
  end
end
