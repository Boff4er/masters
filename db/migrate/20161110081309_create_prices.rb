class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
    	t.integer :user_id
    	t.integer :cat_id
    	t.string :name
    	t.integer :price

      t.timestamps
    end
  end
end
