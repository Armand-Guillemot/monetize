class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :title
      t.string :logo
      t.string :icon
      t.text :description
      t.text :content
      t.text :rem
      t.text :marketing
      t.text :criterion
      t.integer :status
      t.boolean :bonus
      t.boolean :cpf

      t.timestamps
    end
  end
end
