class CreateAudiodialogs < ActiveRecord::Migration
  def change
    create_table :audiodialogs do |t|
    	t.integer :user1_id
    	t.integer :user2_id

      t.timestamps
    end
  end
end
