class GroupsController < ApplicationController


  def index
    @group = Group.all
  end

  def show
    @group = current_user.groups
  end  

  def new
    @group = Group.new
  end

  def create
    @group = Group.create(group_params)
    if @group.save
      @group.members << current_user
      redirect_to @group 
    else
      render :new
    end   
  end

  def show
    @group = Group.find(params[:id])
  end

private

  def group_params
    params.require(:group).permit(
      :name,
      :description,
    )
  end  


end