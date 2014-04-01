class GroupMembershipsController < ApplicationController

  def create
    @group = Group.find(params[:id])
    current_user.join @group
  end

  def destroy
    @group = Group.find(params[:id])
    current_user.leave @group
  end

end