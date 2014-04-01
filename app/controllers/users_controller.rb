 class UsersController < ApplicationController 

  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
    @images = @user.images.includes(:gallery)
  end  

end