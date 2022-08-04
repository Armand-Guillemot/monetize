class ProfilController < ApplicationController
  include Wicked::Wizard
  before_action :authenticate_user!

  steps :social, :produit


  def show
    @user = current_user
    render_wizard
  end
end
