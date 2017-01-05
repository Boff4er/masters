class AddDefaultProfileToUser < ActiveRecord::Migration
  def up
    add_column :users, :default_profile, :string, :default => "user"
    
  end

  def down
    remove_column :users, :default_profile
    
  end
end
