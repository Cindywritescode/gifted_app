require 'open-uri'
require 'json'
require 'nokogiri'

def etsy_api_call(keyword)
  url = 'https://openapi.etsy.com/v2/listings/active?api_key=joxo65hgy17pmzfxhe2adsp0&limit=8&keywords=${keyword}'
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

etsy_search_info('hat')





