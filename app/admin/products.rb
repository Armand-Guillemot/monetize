ActiveAdmin.register Product do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :title, :product_type, :domaine,:min_price, :max_price, :has_marketing, :logo, :icon, :description, :content, :rem, :marketing, :criterion, :status, :bonus, :cpf, :external_url, tags_attributes: [:id, :title, :font_icon, :_destroy ]
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :logo, :icon, :description, :content, :rem, :marketing, :criterion, :status, :bonus, :cpf, :external_url]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  index do
    selectable_column
    index_column
    column :title do |product|
      link_to product.title, admin_product_path(product)
    end
    column :external_url
    column :bonus
    column :cpf
    column "Status" do |product|
      Product.statuses[product.status]
    end
  end

  show do
    columns do
      column do
        attributes_table title: "Info Principal" do
          row :title
          row :logo
          row :icon
          row :external_url
          row "Status" do |product|
            Product.statuses[product.status]
          end
          row :product_type
        end
      end
      column do
        attributes_table title: "Info Principal" do
          row "Minimum", :min_price do |product|
            number_to_currency(product.min_price, unit: "€")
          end
          row "Maximum", :max_price do |product|
            number_to_currency(product.max_price, unit: "€")
          end

          row :domaine
          row :has_marketing
          row :bonus
          row :cpf
        end
      end
    end


    tabs do
      tab "Description" do
        attributes_table title: "" do
          row "Description" do
            product.description.html_safe
          end
          row "Content" do
            product.content.html_safe
          end
          row "Rem" do
            product.rem.html_safe
          end
          row "Marketing" do
            product.marketing.html_safe
          end
          row "Criterion" do
            product.criterion.html_safe
          end
        end

      end

      tab "Tags" do
        table_for product.tags do
          column "Icon", :font_icon do |tag|
            raw("<i class='#{tag.font_icon}'></i>")
          end
          column :title
        end

      end

    end



  end













  form do |f|

      columns do
        column do
          inputs do
            input :title
            input :logo
            input :icon
            input :external_url
            input :status, as: :select, collection: Product.statuses.to_a.map { |e| e.reverse()  }

      
            end
        end
        column do
          inputs do
            input :min_price
            input :max_price
            input :product_type
            input :domaine
            input :has_marketing
            input :bonus
            input :cpf
            end
        end
      end
      tabs do
        tab "Catalogue" do
          input :description, as: :quill_editor, label: false
          input :content, as: :quill_editor, label: false
          input :rem, as: :quill_editor, label: false
          input :marketing, as: :quill_editor, label: false
          input :criterion, as: :quill_editor, label: false
        end
        tab "Tags" do
          f.has_many :tags do |tag|
            tag.inputs do
              tag.input :title
              tag.input :font_icon
            end
        end
       
      end






      f.actions do
        f.action :submit
        f.cancel_link(:back)
      end
    end
  end

end
