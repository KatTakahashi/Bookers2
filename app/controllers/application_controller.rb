class ApplicationController < ActionController::Base

  before_action :authenticate_user!,except: [:top, :about] #vログイン前のアクセス制限
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end

  def after_sign_in_path_for(resource)
    user_path(resource)
  end
  
  def after_sign__path_for(resource)
    user_path(resource)
  end

end
