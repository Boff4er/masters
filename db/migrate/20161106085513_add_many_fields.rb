class AddManyFields < ActiveRecord::Migration
  def up
    add_column :orders, :read, :boolean, :default => false
    
  end

  def down
    remove_column :orders, :read
    
  end
end
