class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
    	# string makes shorter text item usually 1 line, varchar
    	t.string :name, null: false
    	# text makes longer - like paragraph - item
    	t.text :description
    	# make a timestamp in the table
    	t.timestamps
    end
  end
end
