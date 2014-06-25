class User < ActiveRecord::Base
	has_many :galleries
	has_many :images, through: :galleries

	has_many :comments, through: :images

	has_many :likes
	has_many :liked_images, through: :likes, source: :image

	belongs_to :group


	#since user and group are not directly connected via either of their tables, we need to 
	#connect the user with a group by using a "has_many through" relation
	#via the group memberships, which is a two-step process:
	#first the has_many group_memberships (since the user_id is an fkey in group_memberships)
	#then has_many :groups through :group_memberships, 
	# since the group_memberships table also has a group_id fkey

	#Note: need to make sure the group_membership model has a belongs_to :group in order to complete
	#the connection circle among all these tables.

	has_many :group_memberships
	has_many :groups, through: :group_memberships

	#make a validates presence constraint in active record for every not null contstraint in the db schema
	
	validates :email, presence: true, uniqueness: true

	#all validations related to one column in the db stick to a single validation
	#don't use multiple validations keywords for the same column

	validates :password_digest, presence: true

	def member?(group)
		group_ids.include?(group.id)
	end

	def join(group)
		groups << group
	end

	def leave(group)
		groups.destroy(group) 
	end

	def like_it(image)
		liked_images << image	
	end

	def unlike_it(image)
		liked_images.destroy(image)
	end
end
