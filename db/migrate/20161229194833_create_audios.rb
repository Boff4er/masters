class CreateAudios < ActiveRecord::Migration
  def change
    create_table :audios do |t|
    	t.integer :user_id
    	t.string :name
    	t.string :file

      t.timestamps
    end
  end
end
