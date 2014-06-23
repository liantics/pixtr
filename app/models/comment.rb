class Comment < ActiveRecord::Base

	belongs_to :user
	belongs_to :image

 	validates :body, presence: true

 	def self.recent #active record lets us create a class method, and chain it to an activerecord query - in this case, the order SQl query
 		order(created_at: :desc)
 	end
end