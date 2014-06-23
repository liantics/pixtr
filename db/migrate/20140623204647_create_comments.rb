class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.belongs_to :user, index: true, null: false
      t.belongs_to :image, index: true, null: false
      t.string :body
      t.timestamps :timestamp
    end
  end
end
