class Addingmasterandbonustouserproduct < ActiveRecord::Migration[6.0]
  def change
    add_column :user_products, :master_affiliate_commission, :integer, default: 0
    add_column :user_products, :bonus, :integer, default: 0
  end
end