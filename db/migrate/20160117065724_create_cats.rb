class CreateCats < ActiveRecord::Migration
  def change
    create_table :cats do |t|
    	t.string :name
    	t.text :description
    	t.string :photo
    	t.integer :parent_id
    	t.integer :level
    	t.integer :count
		t.integer :ord, :default => 0
		t.boolean :public, :default => false

      t.timestamps
    end
  end
end
