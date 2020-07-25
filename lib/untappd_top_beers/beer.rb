class UntappdTopBeers::Beer

    attr_accessor :name, :brewery, :style, :description, :alcohol_content, :score, :ratings

    @@all = []

    def initialize(name,brewery,style,description,alcohol_content,score,ratings)
        @name = name
        @brewery = brewery
        @style = style
        @description = description
        @alcohol_content = alcohol_content
        @score = score
        @ratings = ratings
        @@all << self
    end

    def self.all
        @@all
    end

    def find_by_name(name)
        @@all.detect do |beer|
            beer.name == name 
        end
    end

    def find_by_brewery(brewery)
        @@all.select do |beer|
            beer.brewery == brewery
        end
    end

    def find_by_style(style)
        @@all.select do |beer|
            beer.style.include?(style)
        end
    end

    def self.new_from_index_page(beer)
        self.new(
            beer.css("div.beer-details p.name").text,
            beer.css("div.beer-details").css("p")[1].text,
            beer.css("div.beer-details").css("p")[2].text,
            beer.css("div.beer-details").css("p")[4].text,
            beer.css("div.details p.abv").text,
            beer.css("div.details div.rating-container span.num").text,
            beer.css("div.details p.raters").text,
        )
    end

end
