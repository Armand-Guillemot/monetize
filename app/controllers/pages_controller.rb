class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:dashboard, :catalogue, :social]
  def home
  end

  def cgu
  end

  def dashboard
  end

  def catalogue
  end

  def social
  end

  def link
    user_product = UserProduct.find(params["user_product_id"])
    user_product.link(10,10)
    redirect_to admin_user_path(user_product.user)
  end
end
