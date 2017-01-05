class AddValsToTask < ActiveRecord::Migration
  def up
    add_column :users, :image, :string
  	add_column :tasks, :cat, :integer
    add_column :tasks, :cat_sub, :integer
    add_column :tasks, :file_image, :string
    add_column :tasks, :budget, :integer
    add_column :tasks, :price_fix, :float
    add_column :tasks, :price_1, :float
    add_column :tasks, :price_2, :float
    add_column :tasks, :time_type, :integer
    add_column :tasks, :date_aktual, :date
    add_column :tasks, :date_count, :integer
    add_column :tasks, :date_start, :date
    add_column :tasks, :date_stop, :date
    add_column :tasks, :user_id, :integer
    add_column :tasks, :city_from, :string
    add_column :tasks, :address_from, :string
    add_column :tasks, :house_from, :string
    add_column :tasks, :kv_from, :string
    add_column :tasks, :city_to, :string
    add_column :tasks, :address_to, :string
    add_column :tasks, :house_to, :string
    add_column :tasks, :kv_to, :string
  end

  def down
    remove_column :users, :image
    remove_column :tasks, :cat
    remove_column :tasks, :cat_sub
    remove_column :tasks, :file_image
    remove_column :tasks, :budget
    remove_column :tasks, :price_fix
    remove_column :tasks, :price_1
    remove_column :tasks, :price_2
    remove_column :tasks, :time_type
    remove_column :tasks, :date_aktual
    remove_column :tasks, :date_count
    remove_column :tasks, :date_start
    remove_column :tasks, :date_stop
    remove_column :tasks, :user_id
    remove_column :tasks, :city_from
    remove_column :tasks, :address_from
    remove_column :tasks, :house_from
    remove_column :tasks, :kv_from
    remove_column :tasks, :city_to
    remove_column :tasks, :address_to
    remove_column :tasks, :house_to
    remove_column :tasks, :kv_to
  end
end
