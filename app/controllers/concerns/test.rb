require 'open-uri'
require 'json'

def etsy_api_call(keyword)
  url = 'https://openapi.etsy.com/v2/listings/active?api_key=joxo65hgy17pmzfxhe2adsp0&limit=8&keywords=${keyword}'
  gifts = URI.open(url).read
  gift_lists = JSON.parse(gifts)
  gift_urls = []
  gift_urls << gift_lists
  gift_urls.each do |gift_list|
    gift_list['results'].each do |results|
      pp results['url']
    end
  end
end

etsy_api_call('handbag')





