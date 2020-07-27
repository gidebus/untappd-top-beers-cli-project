class UntappdTopBeers::CLI


    
    def call
        UntappdTopBeers::Scraper.new.create_beers
        puts "Welcome to Untappd's top 50 beers!"
        puts ""
        select_display
        #displays list of 50 beers
    end

    def select_display
        puts "How would you like the beers displayed by?"
        puts ""
        puts "name"
        puts "style"
        puts "brewery"
        puts ""
        selection = gets.strip
        if selection == "name"
            print_names
        elsif selection == "style"
            print_styles
        elsif selection == "brewery"
            print_breweries
        end
    end

    def self.print_beer(beer)
        puts ""
        puts "----------- #{beer.name} ------------"
        puts ""
        puts "Brewery:           #{beer.brewery}"
        puts "Style:           #{beer.style}"
        puts "%ABV:      #{beer.alcohol_content}"
        puts "Score:           #{beer.score}"
        puts "Ratings:       #{beer.ratings}"
    
        puts ""
        puts "--------------- Description --------------"
        puts ""
        puts "#{beer.description}"
        puts ""
    end

    def print_names
        puts ""
        puts "------------ Beer Names ----------------"
        UntappdTopBeers::Beer.all.each do |beer|
            puts beer.name
        end
        puts ""
        puts "which beer would you like to see?"
        puts ""
        selection = gets.strip
        UntappdTopBeers::Beer.find_by_name(selection)
    end

    def print_styles
        puts ""
        puts "------------ Beer Styles ----------------"
        styles =[]
        UntappdTopBeers::Beer.all.each do |beer|
            styles << beer.style
        end
        styles.uniq.each do |style|
            puts style
        end
        puts "which style's beers would you like to see?"
        puts ""
        selection = gets.strip 
        #selection is a string
        UntappdTopBeers::Beer.find_by_style(selection)
    end

    def print_breweries
        puts ""
        puts "------------ Beer Breweries ----------------"
        breweries =[]
        UntappdTopBeers::Beer.all.each do |beer|
            breweries << beer.brewery
        end
        breweries.uniq.each do |brewery|
            puts brewery
        end
        puts "which brewery's beers would you like to see?"
        puts ""
        selection = gets.strip 
        #selection is a string
        UntappdTopBeers::Beer.find_by_brewery(selection)
    end
     
end