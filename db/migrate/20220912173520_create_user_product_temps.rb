class CreateUserProductTemps < ActiveRecord::Migration[6.0]
  def change
    create_table :user_product_temps do |t|
      t.float :cpf_rate
      t.float :fp_rate
      t.belongs_to :user_product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
