class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.integer :gallery_id
      t.string :url
      #ALWAYS add a timestamp!!
      t.timestamps
    end
  end
end
