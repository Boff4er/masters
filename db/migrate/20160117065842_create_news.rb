class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
    	t.string :name
    	t.string :image
    	t.string :short
    	t.text :description
      t.integer :ord, :default => 0
      t.date :datepost, :default => 0
      t.boolean :public, :default => false

      t.string :meta_title
    	t.string :meta_keywords
    	t.text :meta_description

      t.timestamps
    end
  end
end
