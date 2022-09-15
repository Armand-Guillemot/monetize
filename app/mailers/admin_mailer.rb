class AdminMailer < ApplicationMailer
  def welcome_email
    @user = params[:user]
    mail(to: "admin@nbtraders.fr", subject: "#{@user.pseudo} has joined Monetizee!")
  end

  def chosen_product_email
    @user_product = params[:user_product]
    @user = @user_product.user
    mail(to: "admin@nbtraders.fr", subject: "#{@user.pseudo} chose #{@user_product.product.title}!")
  end
end
