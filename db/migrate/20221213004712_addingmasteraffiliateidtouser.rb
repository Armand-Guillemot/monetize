class Addingmasteraffiliateidtouser < ActiveRecord::Migration[6.0]
  def change
    
    add_reference :users, :master_affiliate, index: true
  end
end
