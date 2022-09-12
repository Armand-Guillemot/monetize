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

end
