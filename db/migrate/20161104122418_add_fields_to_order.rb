class AddFieldsToOrder < ActiveRecord::Migration
  def up
    add_column :orders, :description, :text
    add_column :orders, :price, :float
    add_column :orders, :ltime, :string
  	
  end

  def down
    remove_column :orders, :description
    remove_column :orders, :price
    remove_column :orders, :ltime
    
  end
end
