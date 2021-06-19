require 'open-uri'
require 'nokogiri'
require 'json'

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
      @api_search_results = etsy_search_info(params[:query])
    else
      @gifts = Gift.where(user: current_user)
      @api_search_results = etsy_search_info('handmade')
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

  def etsy_api_call(keyword)
    url = "https://openapi.etsy.com/v2/listings/active?api_key=#{ENV["ETSY_API"]}&limit=8&keywords=#{keyword}"
    gifts = URI.open(url).read
    gift_lists = JSON.parse(gifts)
    gifts = []
    gift_urls = []
    gifts << gift_lists
    gifts.each do |gift_list|
      gift_list['results'].each do |results|
        gift_urls << results['url']
      end
    end
    gift_urls
  end

  def etsy_search_info(keyword)
    urls = etsy_api_call(keyword)
    search_data = []
    urls.each do | url |
      html_file = URI.open(url).read
      html_doc = Nokogiri::HTML(html_file)
      title = html_doc.search('title').first.text
      img = html_doc.search('img').first.attribute('src')
      price = html_doc.css('div[data-buy-box-region="price"] p').text.scan(/\W\d+\W\d\d/)[0]
      gift_search = {
        title: title,
        url: url,
        img: img.value,
        price: price
      }
      search_data << gift_search
    end
    search_data
  end

end
