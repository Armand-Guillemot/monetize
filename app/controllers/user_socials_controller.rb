class UserSocialsController < ApplicationController
  before_action :set_user_social, only: %i[ show edit update destroy ]

  # GET /user_socials or /user_socials.json
  def index
    @user_socials = UserSocial.all
  end

  # GET /user_socials/1 or /user_socials/1.json
  def show
  end

  # GET /user_socials/new
  def new
    @user_social = UserSocial.new
  end

  # GET /user_socials/1/edit
  def edit
  end

  # POST /user_socials or /user_socials.json
  def create
    @user_social = UserSocial.new(user_social_params)
    @user = @user_social.user

    respond_to do |format|
      if @user_social.save
        @user.update(step_1: true)
        format.html { redirect_to user_social_url(@user_social), notice: "User social was successfully created." }
        format.js   { render 'user_socials/create'}
        format.json { render :show, status: :created, location: @user_social }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user_social.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_socials/1 or /user_socials/1.json
  def update
    respond_to do |format|
      if @user_social.update(user_social_params)
        format.html { redirect_to user_social_url(@user_social), notice: "User social was successfully updated." }
        format.json { render :show, status: :ok, location: @user_social }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user_social.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_socials/1 or /user_socials/1.json
  def destroy
    @user = @user_social.user
    @user_social.destroy

    respond_to do |format|
      @user.update(step_1: false) unless @user.user_socials.present?
      format.html { redirect_to user_socials_url, notice: "User social was successfully destroyed." }
      format.json { head :no_content }
      format.js   { render 'user_socials/destroy'}
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user_social
    @user_social = UserSocial.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_social_params
    params.fetch(:user_social, {}).permit(:pseudo, :user_id, :social_id)
  end
end
