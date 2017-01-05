class AddFieldsToUser < ActiveRecord::Migration
  def up
    add_column :users, :price, :float
    add_column :users, :description, :text
    add_column :users, :cats, :text
    add_column :users, :skype, :string
    add_column :users, :www, :string
    add_column :users, :garants, :text
    add_column :users, :pays, :text
    add_column :users, :location, :string
    add_column :users, :raions, :text
  	
  end

  def down
    remove_column :users, :price
    remove_column :users, :description
    remove_column :users, :cats
    remove_column :users, :skype
    remove_column :users, :www
    remove_column :users, :garants
    remove_column :users, :pays
    remove_column :users, :location
    remove_column :users, :raions
    
  end
end
