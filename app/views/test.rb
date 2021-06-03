require 'open-uri'
require 'nokogiri'

url = 'https://www.etsy.com/uk/listing/782364145'
html_file = URI.open(url).read

html_doc = Nokogiri::HTML(html_file)
info = []
title = html_doc.search('title').first.text
img = html_doc.search('img').first.attribute('src')
info << title
info << img.value


# @gift.gift_url
