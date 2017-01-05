class AddParentIdToRecall < ActiveRecord::Migration
  def up
    add_column :recalls, :parent_id, :integer
    
  end

  def down
    remove_column :recalls, :parent_id
    
  end
end
