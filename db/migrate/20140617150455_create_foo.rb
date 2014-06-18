class CreateFoo < ActiveRecord::Migration
  def change
    create_table :foos do |t|
      t.integer :foo_id
      t.string :foo_url
      t.timestamps
    end
  end
end
