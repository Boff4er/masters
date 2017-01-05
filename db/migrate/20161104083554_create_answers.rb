class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
		t.integer :user_id
		t.integer :cat_id
		t.string :name
		t.text :description
		t.boolean :public, :default => false

      t.timestamps
    end
  end
end
