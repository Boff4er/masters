class AddFlagsToOrderTask < ActiveRecord::Migration
  def up
    add_column :tasks, :inwork, :boolean, :default => false
    add_column :tasks, :done, :boolean, :default => false
    add_column :tasks, :finish, :boolean, :default => false
    
  end

  def down
    remove_column :tasks, :inwork
    remove_column :tasks, :done
    remove_column :tasks, :finish
    
  end
end
