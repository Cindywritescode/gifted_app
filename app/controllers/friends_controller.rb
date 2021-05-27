class FriendsController < ApplicationController
  def index
    @friends = Friend.all
  end

  def show
    @friend = Friend.find(params[:id])

  end

  def create
    @friend = Friend.new(friend_params)
    @friend.user = current_user
    if @friend.save
      redirect_to friends_path
    else
      render :new
    end
  end


  private
  
  def friend_params
    params.require(:friend).permit(:name, :user_id)
  end

end
