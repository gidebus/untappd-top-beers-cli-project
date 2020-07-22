require 'nokogiri'
require 'open-uri'

site = "https://untappd.com/beer/top_rated"

doc = Nokogiri::HTML(open(site))

puts doc.css("div.beer-container.beer-list.pad div.beer-item").count

beers = doc.css("div.beer-container.beer-list.pad div.beer-item")

beers.each do |result|
 puts result.css("p.name").text
end
