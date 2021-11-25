class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :authenticate_admin!, if: :admin_url

  def admin_url
    request.fullpath.include?("/admin")
  end

  def after_sign_in_path_for(resource)
    if customer_signed_in?
      root_path(resource)
    elsif admin_signed_in?
      admin_orders_path
    end
  end

  def after_sign_out_path_for(resource)
    if customer_signed_out?
      root_path(resource)
    elsif admin_signed_out?
      new_admin_session_path(resource)
    end
  end



  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :postcode, :address, :phone_number, :is_deleted])
  end
end

