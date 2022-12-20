class Addingstufftoproduct < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :product_type, :string
    add_column :products, :domaine, :string
    add_column :products, :min_price, :integer
    add_column :products, :max_price, :integer
    add_column :products, :has_marketing, :boolean
  end
end
