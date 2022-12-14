# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  after_action :after_creating_user, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:pseudo, :numero_de_telephone])
  end

  def after_creating_user

    if @user.id.present?
      master_affiliate_url = root_url + "?ref=#{@user.id}"
      master_affiliate_bitly = Rails.env.development? ? master_affiliate_url : Bitly::API::Client.new(token: ENV["BITLY_TOKEN"]).shorten(long_url: master_affiliate_url).link
      @user.update(numero_de_telephone: Phonelib.parse(@user.numero_de_telephone).international, master_affiliate_url: master_affiliate_url, master_affiliate_bitly: master_affiliate_bitly)
      @user.update(master_affiliate: User.find_by(id: cookies.signed[:ref])) if cookies.signed[:ref].present?
      
      UserMailer.with(user: @user).welcome_email.deliver_now
      AdminMailer.with(user: @user).welcome_email.deliver_now
    end

  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    "/profil/social"
  end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
