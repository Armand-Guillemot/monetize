class ApplicationController < ActionController::Base
  before_action :cta
  private

  def cta
    if current_user
      @cta_url = "/dashboard"
      @cta_text = "Dashboard"
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
