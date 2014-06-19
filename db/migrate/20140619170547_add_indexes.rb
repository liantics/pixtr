class AddIndexes < ActiveRecord::Migration
  def change
  	add_index :images, :gallery_id
	add_index :users, :email, unique: true
  end
end
