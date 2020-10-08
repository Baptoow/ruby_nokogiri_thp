require 'rspec'
require 'nokogiri'   
require 'open-uri'

town = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com/val-d-oise.html"))
townhall_url = Nokogiri::HTML(URI.open("https://www.annuaire-des-mairies.com/95/avernes.html"))
  
  #avec url mairies page 2 modifier /avernes en /commune(town) pour each liens et aller chercher le mail

  #aller chercher les noms de chaque commune 
def commune(town)
  puts town.css('a.lientxt').text
end

#aller chercher le mail d'une commune 
def get_townhall_email(townhall_url)
  puts townhall_url.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
end

#récuperer les url de chaque ville sur la page 
def get_townhall_urls(town)
  puts town.css('a.lientxt/@href').text
end

commune(town)
get_townhall_email(townhall_url)
get_townhall_urls(town)
#all_url(get_townhall_urls)



#générer tous les url 
#def all_url(get_townhall_urls)
#get_townhall_urls.each do 
#puts "http://annuaire-des-mairies.com/val-d-oise.#{get_townhall_urls}"
#end
#end