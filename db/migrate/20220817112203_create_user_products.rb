class CreateUserProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :user_products do |t|
      t.references :product, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :status

      t.timestamps
    end
  end
end
