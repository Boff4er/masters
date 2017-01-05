class AddDialogIdToMessages < ActiveRecord::Migration
  def up
    add_column :messages, :dialog_id, :integer
    
  end

  def down
    remove_column :messages, :dialog_id
    
  end
end
