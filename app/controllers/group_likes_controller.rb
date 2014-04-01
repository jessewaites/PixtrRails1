 class GroupLikesController < ApplicationController 

  def create
    @group = find_group
    current_user.like @group
    render :group_like_button
  end

  def destroy
    @group = find_group
    current_user.unlike @group
    render :group_like_button
  end

  private

  def find_group
    Group.find(params[:id])
  end  

end