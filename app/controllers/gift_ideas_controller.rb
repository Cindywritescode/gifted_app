class GiftIdeasController < ApplicationController

  def destroy
    @gift_idea = GiftIdea.find(params[:id])
    @gift_idea.destroy
    redirect_to gifts_path
  end

  def new
    @gift = Gift.find(params[:gift_id])
    @gift_idea = GiftIdea.new
  end

  def create
    @friend = Friend.find(params[:gift_idea][:friend_id])
    @gift_idea = GiftIdea.new(gift_idea_params)
    @gift = Gift.find(params[:gift_id])
    @gift_idea.gift = @gift
    @gift_idea.friend = @friend
    if @gift_idea.save
      redirect_to friend_path(@friend)
    else
      render :new
    end
  end

  private

  def gift_idea_params
    params.require(:gift_idea).permit(:friend_id, :gift_id)
  end

end
