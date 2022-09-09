class Addingapilinktousersocial < ActiveRecord::Migration[6.0]
  def change
    add_column :user_socials, :secret, :string
    add_column :user_socials, :external_id, :string

  end
end
