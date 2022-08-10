class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :title
      t.string :logo
      t.string :description
      t.string :content
      t.string :rem
      t.string :marketing
      t.string :criterion
      t.integer :status
      t.boolean :bonus
      t.boolean :cpf

      t.timestamps
    end
  end
end
