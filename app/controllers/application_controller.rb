class ApplicationController < ActionController::Base



  private
  def authenticate_user!
    if user_signed_in?
      super
    else
      redirect_to new_user_registration_path, notice: "Vous devez vous inscrire ou vous connecter pour voir cette page."
    end
  end
end
