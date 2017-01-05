class AddPtypeToUSer < ActiveRecord::Migration
  def up
    add_column :users, :ptype, :string
    add_column :users, :order, :integer
    
  end

  def down
    remove_column :users, :ptype
    remove_column :users, :order
    
    
  end
end
