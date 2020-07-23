require 'nokogiri'
require 'open-uri'

class UntappdTopBeers::Scraper

    untappd = "https://untappd.com/beer/top_rated"

    site = Nokogiri::HTML(open(untappd))

    def page
        site.css("div.beer-container.beer-list.pad div.beer-item")
    end

        beers = doc.css("div.beer-container.beer-list.pad div.beer-item")

    beers.each do |result|
        puts result.css("p.name").text
    end

end
