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

end
