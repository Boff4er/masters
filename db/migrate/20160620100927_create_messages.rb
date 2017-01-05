class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
		t.integer :to_user
		t.integer :from_user
		t.integer :task_id
		t.text :description
		t.boolean :read, :default => false
		t.boolean :public, :default => false

      t.timestamps
    end
  end
end
