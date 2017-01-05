class AddPtypeTask < ActiveRecord::Migration
  def up
    add_column :tasks, :ptype, :string
    
  end

  def down
    remove_column :tasks, :ptype
    
  end
end
