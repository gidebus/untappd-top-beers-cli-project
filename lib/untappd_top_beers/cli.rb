class UntappdTopBeers::CLI
    
    def call
        puts "Welcome to Untappd's top 50 beers!"
        #displays list of 50 beers
    end

    def print_beer(beer)
        puts ""
        puts "----------- #{beer.name} ------------"
        puts ""
        puts "Brewery:           #{beer.brewery}"
        puts "Style:          #{beer.style}"
        puts "%ABV:            #{beer.alcohol_content}"
        puts "Score:             #{beer.score}"
        puts "Ratings:            #{beer.ratings}"
    
        puts ""
        puts "---------------Description--------------"
        puts ""
        puts "#{beer.description}"
        puts ""
      end

end