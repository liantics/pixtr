class User < ActiveRecord::Base
	has_many :galleries

	#make a validates presence constraint in active record for every not null contstraint in the db schema
	
	validates :email, presence: true, uniqueness: true
	#all validations related to one column in the db stick to a single validation
	#don't use multiple validations keywords for the same column

	validates :password_digest, presence: true

end
