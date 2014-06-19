class DropFoosTable < ActiveRecord::Migration
  def up
    drop_table :foos
  end
end
