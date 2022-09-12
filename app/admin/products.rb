ActiveAdmin.register Product do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :title, :logo, :icon, :description, :content, :rem, :marketing, :criterion, :status, :bonus, :cpf, :external_url
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
    attributes_table title: "Info Principal" do
      row :title
      row "Status" do |product|
        Product.statuses[product.status]
      end
      row :external_url
      row :bonus
      row :cpf

      row :icon
      row :logo

    end

    tabs do
      tab "Description" do
        attributes_table title: "" do
          row "Description" do
            product.description.html_safe
          end
        end

      end

      tab "Content" do
        attributes_table title: "" do
          row "Content" do
            product.content.html_safe
          end
        end

      end

      tab "Rem" do
        attributes_table title: "" do
          row "Rem" do
            product.rem.html_safe
          end
        end

      end

      tab "Marketing" do
        attributes_table title: "" do
          row "Marketing" do
            product.marketing.html_safe
          end
        end

      end

      tab "Criterion" do
        attributes_table title: "" do
          row "Criterion" do
            product.criterion.html_safe
          end
        end

      end
    end



  end













  form do |f|
    inputs do
      input :title
      input :logo
      input :icon
      input :external_url
      input :status, as: :select, collection: Product.statuses.to_a.map { |e| e.reverse()  }
      tabs do
        tab "Description" do
          input :description, as: :quill_editor, label: false
        end
        tab "Content" do
          input :content, as: :quill_editor, label: false
        end
        tab "Rem" do
          input :rem, as: :quill_editor, label: false
        end
        tab "Marketing" do
          input :marketing, as: :quill_editor, label: false
        end
        tab "Criterion" do
          input :criterion, as: :quill_editor, label: false
        end
      end






      f.actions do
        f.action :submit
        f.cancel_link(:back)
      end
    end
  end

end
