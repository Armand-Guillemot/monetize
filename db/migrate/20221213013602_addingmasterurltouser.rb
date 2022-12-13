class Addingmasterurltouser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :master_affiliate_url, :string
    add_column :users, :master_affiliate_bitly, :string
  end
end
