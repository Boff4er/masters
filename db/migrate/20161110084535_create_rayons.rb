class CreateRayons < ActiveRecord::Migration
  def change
    create_table :rayons do |t|
    	t.integer :user_id
    	t.string :name

      t.timestamps
    end
  end
end
