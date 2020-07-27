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

    def self.find_by_name(name)
        beer = @@all.detect do |beer|
            beer.name == name 
        end
        UntappdTopBeers::CLI.print_beer(beer)
    end

    def self.find_by_brewery(brewery)
        puts ""
        beers = @@all.select do |beer|
            beer.brewery == brewery
        end
        beers.each do |beer|
            print beer.name
            puts ""
        end
        puts ""
        puts "which beer would you like to see?"
        puts ""
        selection = gets.strip
        self.find_by_name(selection)
    end

    def self.find_by_style(style)
        puts ""
        beers = @@all.select do |beer|
            beer.style.include?(style)
        end
        beers.each do |beer|
            print beer.name
            puts ""
        end
        puts ""
        puts "which beer would you like to see?"
        puts ""
        selection = gets.strip
        self.find_by_name(selection)
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
