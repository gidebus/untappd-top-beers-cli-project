class UntappdTopBeers::CLI
    
    def call
        UntappdTopBeers::Scraper.new.create_beers
        puts "Welcome to Untappd's top 50 beers!"
        #select_display
        #displays list of 50 beers
    end

    def select_display
        puts "How would you like the beers displayed by?"
        puts "name"
        puts "style"
        puts "brewery"
        selection = gets.strip
        if selection == "name"
            print_names
        elsif selection == "style"
            print_styles
        elsif selection == "brewery"
            print_breweries
        end
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

    def print_names
        UntappdTopBeers::Beer.self.all.each do |beer|
            puts beer.name
        end
    end

    def print_styles
        styles =[]
        UntappdTopBeers::Beer.self.all.each do |beer|
            styles << beer.style
        end
        styles.uniq.each do |style|
            puts style
        end
    end

    def print_breweries
        breweries =[]
        UntappdTopBeers::Beer.self.all.each do |beer|
            breweries << beer.brewery
        end
        breweries.uniq.each do |brewery|
            puts brewery
        end
    end
     

end