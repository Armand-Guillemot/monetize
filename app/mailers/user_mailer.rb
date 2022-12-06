class UserMailer < ApplicationMailer

  def test_email
    mail(to: "armand.guillemot.56@gmail.com", subject: 'test')
  end

  def welcome_email
    @user = params[:user]
    mail(to: @user.email, subject: 'Bienvenue chez Monetizee !')
  end

  def validated_product_email
    @user_product = params[:user_product]
    @user = @user_product.user
    mail(to: @user.email, subject: "Votre candidature pour #{@user_product.product.title} a été acceptée !")
  end

end
