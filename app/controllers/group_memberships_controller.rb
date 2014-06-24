class GroupMembershipsController < ApplicationController

	def create
		@group_membership = GroupMembership.new(user_id: current_user.id, group_id: params[:group_id])

		if @group_membership.save
			redirect_to :groups
		end
	end

end