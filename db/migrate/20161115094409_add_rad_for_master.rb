class AddRadForMaster < ActiveRecord::Migration
  def up
    add_column :messages, :read_master, :boolean, :default => false
    add_column :orders, :read_master, :boolean, :default => false
    
  end

  def down
    remove_column :messages, :read_master
    remove_column :orders, :read_master
    
  end
end
