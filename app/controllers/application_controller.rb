class ApplicationController < ActionController::Base
  before_action :cta
  before_action :cookie_jar
  private

  def cookie_jar
    if !current_user.present? && params["ref"].present? && User.find_by(id: params["ref"]).present?
      cookies.signed[:ref] = { :value => params["ref"], :expires => DateTime.now + 1.month}
    end
  end

  def cta
    if current_user
      @cta_url = "/dashboard"
      @cta_text = '<i class="fas fa-tachometer-alt"></i> Dashboard'.html_safe
    else
      @cta_url = "/inscription"
      @cta_text = '<i class="fas fa-user-plus"></i> Inscription'.html_safe
    end
  end

  def authenticate_user!
    if user_signed_in?
      super
    else
      redirect_to new_user_registration_path, notice: "Vous devez vous inscrire ou vous connecter pour voir cette page."
    end
  end
end
