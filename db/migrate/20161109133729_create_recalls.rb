class CreateRecalls < ActiveRecord::Migration
  def change
    create_table :recalls do |t|
    	t.integer :user_id
    	t.integer :task_id
    	t.integer :from_user_id
    	t.text :description
		t.boolean :question1, :default => false
		t.boolean :question2, :default => false
		t.boolean :question3, :default => false
		t.boolean :question4, :default => false
		t.boolean :question5, :default => false
		t.boolean :question6, :default => false
		t.boolean :question7, :default => false
		t.boolean :question8, :default => false
		t.boolean :question9, :default => false
		t.boolean :question10, :default => false
		t.integer :rating
		t.boolean :isgoood, :default => true
      t.timestamps
    end
  end
end
