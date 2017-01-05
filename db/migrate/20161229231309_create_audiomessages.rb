class CreateAudiomessages < ActiveRecord::Migration
  def change
    create_table :audiomessages do |t|
    	t.integer :to_user
		t.integer :from_user
		t.integer :task_id
		t.text :description
		t.string :audio
		t.boolean :read, :default => false
		t.boolean :public, :default => false
		t.integer :order_id
		t.integer :audiodialog_id
		t.boolean :read_master, :default => false

      t.timestamps
    end
  end
end
