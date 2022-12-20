class CreateTags < ActiveRecord::Migration[6.0]
  def change
    create_table :tags do |t|
      t.belongs_to :product, null: false, foreign_key: true
      t.string :title
      t.string :font_icon

      t.timestamps
    end
  end
end
