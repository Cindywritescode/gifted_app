class FriendsController < ApplicationController
  before_action :find_friend, only: [:show, :destroy]

  def index
    @friends = Friend.where(user: current_user)
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

  def show
    @note = Note.new
  end

  def destroy
    @friend.destroy
    redirect_to friends_path
  end


  private
  def friend_params
    params.require(:friend).permit(:name, :user_id)
  end

  def find_friend
    @friend = Friend.find(params[:id])
  end
end
