class AddDoUserIdToTask < ActiveRecord::Migration
  def up
  	add_column :tasks, :userdo_id, :integer
  end

  def down
    remove_column :tasks, :userdo_id
  end
end
