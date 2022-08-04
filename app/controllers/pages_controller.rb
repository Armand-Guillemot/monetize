class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:dashboard]
  def home
  end

  def cgu
  end

  def dashboard
  end

end
