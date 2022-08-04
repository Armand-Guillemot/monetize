class CreateUserSocials < ActiveRecord::Migration[6.0]
  def change
    create_table :user_socials do |t|
      t.references :user, null: false, foreign_key: true
      t.references :social, null: false, foreign_key: true
      t.string :pseudo

      t.timestamps
    end
  end
end
