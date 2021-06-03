class GiftsController < ApplicationController
  before_action :set_gift, only: [:show, :edit, :update, :destroy]

  def new
    @gift = Gift.new
  end

  def create
    @gift = Gift.new(gift_params)
    @gift.user = current_user
    friend_id = @gift.friend_ids.first
    if @gift.save && !friend_id.nil?
      @gift_idea = GiftIdea.new(friend_id: friend_id, gift_id: @gift.id)
      @gift_idea.save!
      redirect_to friend_path(friend_id)
    elsif @gift.save && friend_id.nil?
      redirect_to gifts_path
    else
      render :new
    end
  end

  def index
    @gifts = Gift.where(user: current_user)
  end


  def destroy
    @gift.destroy
    redirect_to gifts_path
  end

  private

  def gift_params
    params.require(:gift).permit(:gift_url, :friend_ids, :photo)
  end

  def set_gift
    @gift = Gift.find(params[:id])
  end

end
