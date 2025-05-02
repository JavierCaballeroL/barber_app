class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  before_action :configure_permitted_parameters, if: :devise_controller?
  allow_browser versions: :modern

  def after_sign_out_path_for(resource)
    flash[:notice] = "Sesión cerrada correctamente"
    root_path
  end

  def after_sign_in_path_for(resource)
    flash[:notice] = "Sesión iniciada correctamente"
    root_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  end

end
