class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Pundit authorization
  include Pundit

  # Manages Pundit errors
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  # Setting layouts
  layout :layout_by_resource

  private

  # Pundit authorization error
  def user_not_authorized
    flash[:warning] = "Você não está autorizado a executar essa ação."
    redirect_to (request.referrer || admin_path)
  end

  # Set default layout
  def layout_by_resource
    if devise_controller? && resource_name == :admin
      "devise"
    else
      "application"
    end
    if devise_controller? && resource_name == :member
      "devise"
    else
      "application"
    end
  end
end
