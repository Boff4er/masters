class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
    	t.integer :user_id
		t.float :value
		t.string :status
		t.boolean :done, :default => false
		t.string :key

      t.timestamps
    end
  end
end
