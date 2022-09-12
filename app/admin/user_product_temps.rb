ActiveAdmin.register UserProductTemp do
  menu label: "event", priority: 99, if: proc { false }
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :cpf_rate, :fp_rate, :user_product_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:cpf_rate, :fp_rate]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  controller do
    after_create :after_creating_user_product_temp

    def create

      # Instance method
      super do |success,failure|
        success.html { redirect_to admin_user_path(UserProduct.find(params["user_product_temp"]["user_product_id"]).user) }
        failure.html { redirect_to admin_user_path(UserProduct.find(params["user_product_temp"]["user_product_id"]).user) }
      end

    end


    def after_creating_user_product_temp(user_product_temp)
      user_product = @user_product_temp.user_product
      user = user_product.user

      user_product.link(@user_product_temp.cpf_rate, @user_product_temp.fp_rate)
      user.update(confirmed: true)
      @user_product_temp.destroy
    end

  end

  form do |f|
    inputs do
      input :cpf_rate
      input :fp_rate
      input :user_product_id, as: :hidden
      f.actions do
        f.action :submit
        f.cancel_link(:back)
      end
    end
  end


end
