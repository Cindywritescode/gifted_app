class GiftIdeasController < ApplicationController

  def destroy
    @gift_idea = GiftIdea.find(params[:id])
    @gift_idea.destroy
    redirect_to friend_path(@gift_idea.gift)
  end

end