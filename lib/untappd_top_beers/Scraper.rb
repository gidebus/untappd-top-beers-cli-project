require 'nokogiri'
require 'open-uri'

class UntappdTopBeers::Scraper


    def untappd
        Nokogiri::HTML(open("https://untappd.com/beer/top_rated"))
    end

    def scrape_index_page
        untappd.css("div.beer-container.beer-list.pad div.beer-item")
    end

    def create_beers
        scrape_index_page.each do |beer|
            UntappdTopBeers::Beer.new_from_index_page(beer)
        end
    end

end
