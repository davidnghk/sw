class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :set_locale
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user! 
  before_filter :prepare_for_mobile 
   
  protected

  def set_locale
    I18n.locale = params[:locale] if params[:locale].present? 
  end

  def default_url_options(options={})
      {:locale => I18n.locale}
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:edit_account) do |user_params|
        user_params.permit(:name, :phone_no, :email, :current_password, 
          :image, :hkid_image, :role, :qualification, :registration_no,  
          :registration_chinese_name, :registration_english_name, 
          :registration_expiry_date, :certificate_image, :status, 
          :provider, :uid, :oauth_token, :oauth_expires_at, 
          :bank, :bank_account_no, :bank_account_name)
	  end
      devise_parameter_sanitizer.permit(:account_update) do |user_params|
        user_params.permit(:name, :phone_no, :email, :current_password, 
          :image, :hkid_image, :role, :qualification, :registration_no, 
          :registration_chinese_name, :registration_english_name, 
          :registration_expiry_date, :certificate_image, :status, 
          :provider, :uid, :oauth_token, :oauth_expires_at, 
          :bank, :bank_account_no, :bank_account_name)
	  end
	  devise_parameter_sanitizer.permit(:sign_up) do |user_params|
        user_params.permit(:name, :phone_no, :email, :password, 
          :image, :hkid_image, :role, :registrtion_no, :qualification, 
          :registration_no, :registration_chinese_name, :registration_english_name, 
          :registration_expiry_date, :certificate_image, :status, :bank,
          :provider, :uid, :oauth_token, :oauth_expires_at,  
          :bank_account_no, :bank_account_name)
	  end
    devise_parameter_sanitizer.permit(:partner_up) do |user_params|
        user_params.permit(:name, :phone_no, :email, :password, 
          :image, :hkid_image, :role, :registrtion_no, :qualification, 
          :registration_no, :registration_chinese_name, :registration_english_name, 
          :registration_expiry_date, :certificate_image, :status, 
          :provider, :uid, :oauth_token, :oauth_expires_at, 
          :bank, :bank_account_no, :bank_account_name)
	  end
  end

  private
  
  def mobile_device?
    if session[:mobile_param]
      session[:mobile_param] == "1"
    else
      request.user_agent =~ /Mobile/
    end
  end
  
  helper_method :mobile_device?
  
  def prepare_for_mobile
    session[:mobile_param] = params[:mobile] if params[:mobile]
    # request.format = :mobile if mobile_device?
  end

end
