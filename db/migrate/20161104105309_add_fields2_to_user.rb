class AddFields2ToUser < ActiveRecord::Migration
  def up
    add_column :users, :status, :text
    add_column :users, :b_date, :integer
    add_column :users, :b_month, :integer
    add_column :users, :b_year, :integer
  	
  end

  def down
    remove_column :users, :status
    remove_column :users, :b_date
    remove_column :users, :b_month
    remove_column :users, :b_year
    
  end
end
