class GroupMembershipsController < ApplicationController

	def create

		group = Group.find(params[:group_id])
		current_user.join group

		#line above is used in extracting the below out into the model
		#see the "leave" method defined in the model

		# current_user.groups << group

		# The above does the exact same thing as the lines below:
		# @group_membership = GroupMembership.new(user_id: current_user.id, group_id: params[:group_id])
		#
		# if @group_membership.save		
		# end

		redirect_to :groups

	end

	def destroy
		
		group = Group.find(params[:group_id])

		current_user.leave(group)
		#line above is used in extracting the below out into the model
		#see the "leave" method defined in the model
		# current_user.groups.destroy(group)

		# the above two lines do the same as the two lines below. It takes advantage of the user
		#group_mem_and_user = GroupMembership.where(user_id: current_user.id, group_id: params[:group_id])
		#GroupMembership.destroy(group_mem_and_user)
		
		redirect_to :groups
	end

end