class AddBalanceTo < ActiveRecord::Migration
  def up
    add_column :users, :balance, :float
    
  end

  def down
    remove_column :users, :balance
    
  end
end
