require 'rspec'
require 'nokogiri'   
require 'open-uri'

page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))


crypto_name = page.xpath("//html/body/div/div[1]/div[2]/div[1]/div[2]/div/div[2]/div[3]/div/table/tbody/tr/td[3]/div/text()").map{|x| x.to_s}
crypto_price = page.xpath("/html/body/div/div[1]/div[2]/div[1]/div[2]/div/div[2]/div[3]/div/table/tbody/tr/td[5]/a/text()").map {|x| x.to_s }


hash_price_list = Hash[*crypto_name.zip(crypto_price).flatten]
hash_price_list.each {|c, v|}

puts hash_price_list