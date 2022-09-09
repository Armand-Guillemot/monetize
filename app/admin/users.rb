ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :email, :numero_de_telephone, :pseudo, :step_1, :step_2, :confirmed
  #
  # or
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :sign_in_count, :current_sign_in_at, :last_sign_in_at, :current_sign_in_ip, :last_sign_in_ip, :numero_de_telephone, :pseudo, :step_1, :step_2, :confirmed]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  index do
    selectable_column
    index_column
    column :email do |user|
      link_to user.email, admin_user_path(user)
    end
    column :pseudo
    column :numero_de_telephone
    column "Date", :created_at, sortable: :created_at do |user|
      status_tag((user.created_at.utc + 2.hours).strftime("%d/%m/%y %H:%M"))
    end
    column :step_1
    column :step_2
    column :confirmed
  end


  show do
    div(style: "display:flex;align-items:center;justify-content:space-between;") do
      h3(style: "margin-bottom:0;margin-right:10px;") do
        "Main user info"
      end
    end
    hr(style:"margin:0;")
    columns do
      column do
        attributes_table title: "" do
          row :email
          row :pseudo
          row :numero_de_telephone
          row "Date", :created_at, sortable: :created_at do |user|
            status_tag((user.created_at.utc + 2.hours).strftime("%d/%m/%y %H:%M"))
          end
          row :confirmed
        end
      end
      column do
        attributes_table title: "" do
          row :sign_in_count
          row :current_sign_in_at do
            status_tag((user.current_sign_in_at.utc + 2.hours).strftime("%d/%m/%y %H:%M"))
          end
          row :current_sign_in_ip
          row :last_sign_in_at do
            status_tag((user.last_sign_in_at.utc + 2.hours).strftime("%d/%m/%y %H:%M"))
          end
          row :last_sign_in_ip
        end
      end
    end
    div(style:"height:40px;")
    columns do
      div(style:"width:34%; margin-right:2%;") do
        div(style: "display:flex;align-items:center;justify-content:space-between;") do
          h3(style: "margin-bottom:0;margin-right:10px;") do
            "Résaux"
          end
        end
        hr(style:"margin:0;")
        user.user_socials.each do |user_social|
          render "components/user_social", user_social: user_social
        end
      end
      div(style:"width:64%") do
        div(style: "display:flex;align-items:center;justify-content:space-between;") do
          h3(style: "margin-bottom:0;margin-right:10px;") do
            "Produits"
          end
        end
        hr(style:"margin:0;")
        render "components/product_admin", user_products: user.user_products
      end
    end
    active_admin_comments
  end




  form do |f|
    inputs do
      h3 "hello"
      input :email
      input :pseudo
      input :numero_de_telephone
      input :confirmed
      f.actions do
        f.action :submit
        f.cancel_link(:back)
      end
    end
  end

end
