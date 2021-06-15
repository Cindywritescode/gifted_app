require 'open-uri'
require 'nokogiri'

class GiftsController < ApplicationController
  before_action :set_gift, only: [:show, :edit, :update, :destroy]

  def new
    @gift = Gift.new
  end

  def create
    @gift = Gift.new(gift_params)
    @gift.user = current_user
    if @gift.gift_url.include? 'etsy'
      etsy_info(@gift.gift_url)
      @gift.product_name = @info[0]
      @gift.photo = @info[1]
      @gift.price = @info[2]
    end
    friend_id = @gift.friend_ids.first
    if @gift.save && !friend_id.nil?
      @gift_idea = GiftIdea.new(friend_id: friend_id, gift_id: @gift.id)
      # @gift_idea.save!
      redirect_to friend_path(friend_id)
    elsif @gift.save && friend_id.nil?
      redirect_to gifts_path
    else
      render :new
    end
  end

  def index
    if params[:query].present?
      @gifts = Gift.search_by_product_name(params[:query]).where(user: current_user)
    else
      @gifts = Gift.where(user: current_user)
    end
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

  def etsy_info(gift_url)
    url = gift_url
    html_file = URI.open(url).read
    html_doc = Nokogiri::HTML(html_file)
    @info = []
    title = html_doc.search('title').first.text
    img = html_doc.search('img').first.attribute('src')
    price = html_doc.css('div[data-buy-box-region="price"] p').text.scan(/\W\d+\W\d\d/)[0]
    @info << title
    @info << img.value
    @info << price
  end

end
