class GiftsController < ApplicationController
  before_action :set_gift, only: [:show, :edit, :update, :destroy]

  def new
    @gift = Gift.new
  end

  def create
    @gift = Gift.new(gift_params)
    @gift.user = current_user
    if @gift.save
      redirect_to friend_path(@gift)
    else
      render "gifts/index"
    end
  end

  def show
  end

  def index
    @gifts = Gift.where(user: current_user)
  end

  def edit
  end

  def update
    @gift.update(gift_params)
    if @gift.save
      render :show
    else
      render :edit
    end
  end

  def destroy
    @gift.destroy
    redirect_to gifts_path
  end

  private

  def gift_params
    params.require(:gift).permit(:gift_url)
  end

  def set_gift
    @gift = Gift.find(params[:id])
  end

end
