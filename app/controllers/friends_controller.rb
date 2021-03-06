class FriendsController < ApplicationController
  before_action :set_friend, only: [:show, :destroy]

  def index
    if params[:query].present?
      @friends = Friend.search_by_friend_name(params[:query]).where(user: current_user)
    else
      @friends = Friend.where(user: current_user)
    end
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
    @gifts = Gift.all
    @note = Note.new
    @notes = @friend.notes
    @gift_ideas = GiftIdea.where(friend_id: params[:id])
  end

  def destroy
    @friend.destroy
    redirect_to friends_path
  end

  private
  def friend_params
    params.require(:friend).permit(:name, :user_id, :photo)
  end

  def set_friend
    @friend = Friend.find(params[:id])
  end
end
