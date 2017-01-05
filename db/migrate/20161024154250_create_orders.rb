class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
		t.integer :task_id
		t.integer :user_id
		t.integer :userdo_id
		t.string :status
		t.boolean :work, :default => false

      t.timestamps
    end
  end
end
