class CreateSocials < ActiveRecord::Migration[6.0]
  def change
    create_table :socials do |t|
      t.string :logo
      t.string :title

      t.timestamps
    end
  end
end
