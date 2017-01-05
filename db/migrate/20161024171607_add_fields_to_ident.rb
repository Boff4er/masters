class AddFieldsToIdent < ActiveRecord::Migration
  def up
  	add_column :identities, :photo, :text
  	add_column :users, :photo, :text
  end

  def down
    remove_column :identities, :photo
    remove_column :users, :photo
  end
end