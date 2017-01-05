class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
    	t.integer :cat_id
		t.string :name
		t.text :map
		t.integer :view
		t.integer :user_count
		t.float :price1
		t.float :price2
		t.string :from1
		t.string :from2
		t.datetime :time1
		t.datetime :time2
		t.text :description
		t.boolean :read, :default => false
		t.boolean :public, :default => false

      t.timestamps
    end
  end
end
