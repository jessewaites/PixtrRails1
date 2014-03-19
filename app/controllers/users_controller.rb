 class UsersController < ApplicationController 

  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
    @images = @user.images

  end  

  # private

  # def comment_params
  #   params.require(:comment).permit(:body).merge(user_id: current_user.id)
  # end

end