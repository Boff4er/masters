class AddOrderIdToMessages < ActiveRecord::Migration
  def up
    add_column :messages, :order_id, :integer
    
  end

  def down
    remove_column :messages, :order_id
    
  end
end