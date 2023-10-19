class ApplicationController < ActionController::Base
  # Set up user authentication
  before_action :authenticate_user!, unless: :welcome_index_url
  # Add addtional parameters
  before_action :configure_permitted_parameters, if: :devise_controller?
  # Customize redirect hooks
  def after_sign_in_path_for(_resource)
    user_categories_url(current_user)
  end
  # Permit addtional parameters (@lazy)

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :sign_up, keys: %i[name email password confirm_password]
    )
    devise_parameter_sanitizer.permit(
      :sign_in, keys: %i[email password]
    )
  end
end
