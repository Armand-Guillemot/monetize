class Addingapilinktousersocial < ActiveRecord::Migration[6.0]
  def change
    add_column :user_products, :secret, :string
    add_column :user_products, :external_id, :string
    add_column :user_products, :visits, :integer, default: 0
    add_column :user_products, :inscriptions, :integer, default: 0
    add_column :user_products, :ventes, :integer, default: 0
    add_column :user_products, :commissions, :integer, default: 0
    add_column :user_products, :commissions_pending, :integer, default: 0
    add_column :user_products, :commissions_validated, :integer, default: 0
    add_column :user_products, :linked, :boolean, default: false
  end
end
