class CreateTaggings < ActiveRecord::Migration
  def change
    create_table :taggings do |t|
      t.belongs_to :image, index: true, null: false
      t.belongs_to :tag, index: true, null: false
      t.timestamps null: false
    end
    add_index :taggings, [:image_id, :tag_id], unique: true
  end
end
