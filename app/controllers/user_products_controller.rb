class UserProductsController < ApplicationController
  before_action :set_user_product, only: %i[ show edit update destroy ]

  # GET /user_products or /user_products.json
  def index
    @user_products = UserProduct.all
  end

  # GET /user_products/1 or /user_products/1.json
  def show
  end

  # GET /user_products/new
  def new
    @user_product = UserProduct.new
  end

  # GET /user_products/1/edit
  def edit
  end

  # POST /user_products or /user_products.json
  def create
    @user_product = UserProduct.new(user_product_params)
    @user = @user_product.user

    respond_to do |format|
      if @user_product.save
        @user.update(step_2: true)
        format.html { redirect_to dashboard_path, notice: "Votre demande a bien été prise en compte." }
        format.json { render :show, status: :created, location: @user_product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_products/1 or /user_products/1.json
  def update
    respond_to do |format|
      if @user_product.update(user_product_params)
        format.html { redirect_to user_product_url(@user_product), notice: "User product was successfully updated." }
        format.json { render :show, status: :ok, location: @user_product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_products/1 or /user_products/1.json
  def destroy
    @user_product.destroy

    respond_to do |format|
      format.html { redirect_to user_products_url, notice: "User product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user_product
    @user_product = UserProduct.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_product_params
    params.fetch(:user_product, {}).permit(:status, :user_id, :product_id)
  end
end
