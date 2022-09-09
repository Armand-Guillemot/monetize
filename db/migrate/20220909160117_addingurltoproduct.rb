class Addingurltoproduct < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :external_url, :string
  end
end
