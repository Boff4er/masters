class CreateFavusers < ActiveRecord::Migration
  def change
    create_table :favusers do |t|
    	t.integer :profile_id
    	t.string :user_id

      t.timestamps
    end
  end
end
