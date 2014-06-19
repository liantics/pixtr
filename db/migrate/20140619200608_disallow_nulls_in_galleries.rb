class DisallowNullsInGalleries < ActiveRecord::Migration
  def change
  	#changes the column's null allowability
  	# :table, :column_name, null_allowability
  	change_column_null :galleries, :user_id, false

  	
  end
end
