class Cli 

    @@menu_options = ["search for books", "view reading list", "exit"]

    def initialize 
        @menu_selection = nil
        @query_input = nil
        @reading_list = []
    end

    def run
        puts " "
        puts "Welcome to My Reading List."
        puts " "

        until @menu_selection == 3
            self.display_menu_options
            @menu_selection = gets.chomp.to_i 
            if @menu_selection == 1
                query_api
                display_books
                save_book
            elsif @menu_selection == 2
                puts "You entered 2"
            elsif @menu_selection == 3
                puts "Exiting the program"
            end
        end
        


        puts "Thanks for using My Reading List. See you next time!"
    end

    def self.menu_options 
        @@menu_options
    end

    def display_menu_options
        puts "Please choose an option: (1-3)"
        puts " "
        Cli.menu_options.each_with_index{|option, index| puts "#{index+1}. #{option.capitalize}"}
        puts " "
    end

    def query_api
        puts "Please enter a search term."
        @query_input = gets.chomp
        api = Api.new(@query_input)
        api.create_books
    end

    def display_books
        books = Book.find_by_query(@query_input)
        books.each_with_index {|book, index| book.show_book(index)}
    end

    def save_book 
        puts "Would you like to save one of these books? (y/n)"
        save = gets.chomp.downcase
        if save == "n" 
            return 
        elsif save == "y"
            puts "Which book would you like to save? (1-5)"
            index = gets.chomp.to_i - 1
            book = Book.find_by_query(@query_input)[index]
            book.save_to_reading_list
        end
    end
end