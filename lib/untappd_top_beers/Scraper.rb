require 'nokogiri'
require 'open-uri'

class UntappdTopBeers::Scraper


    def untappd
        Nokogiri::HTML(open("https://untappd.com/beer/top_rated"))
    end

    def index_page
        beers = untappd.css("div.beer-container.beer-list.pad div.beer-item")
        beers.each do |result|
            puts result.css("p.name").text
        end
    end

    def create_beers
    end

end
