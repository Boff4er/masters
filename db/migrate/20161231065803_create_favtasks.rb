class CreateFavtasks < ActiveRecord::Migration
  def change
    create_table :favtasks do |t|
    	t.integer :profile_id
    	t.string :task_id

      t.timestamps
    end
  end
end
