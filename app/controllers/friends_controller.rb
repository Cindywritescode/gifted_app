class FriendsController < ApplicationController
  before_action :set_friend, only: [:show, :destroy]

  def index
    @friends = Friend.where(user: current_user)
  end

  def new
    @friend = Friend.new  
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
    @notes = @friend.notes
  end

  def destroy
    @friend.destroy
    redirect_to friends_path
  end


  private
  def friend_params
    params.require(:friend).permit(:name, :user_id)
  end

  def set_friend
    @friend = Friend.find(params[:id])
  end
end
