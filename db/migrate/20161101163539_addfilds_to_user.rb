class AddfildsToUser < ActiveRecord::Migration
  def up
    add_column :users, :ismaster, :boolean
    add_column :users, :ismasterfull, :boolean
  	
  end

  def down
    remove_column :users, :ismaster
    remove_column :users, :ismasterfull
    
  end
end
