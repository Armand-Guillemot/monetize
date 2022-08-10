class Addingstufftouser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :numero_de_telephone, :string
    add_column :users, :pseudo, :string
    add_column :users, :step_1, :boolean
    add_column :users, :step_2, :boolean
    add_column :users, :confirmed, :boolean
  end
end
