class GroupMembership < ActiveRecord::Base
	belongs_to :group
	belongs_to :user
	validates :user, uniqueness: { scope: :group,
    message: "You've already added yourself to this group, maybe in a different window or tab." }
end