class Cli 

    @@menu_options = ["search for books", "view reading list", "exit"]

    def initialize 
        @input = nil
        @reading_list = []
    end

    def run
        puts "Welcome to My Reading List."
        puts " "

        until @input == 3
            self.display_menu_options
            @input = gets.chomp.to_i 
            if @input == 1
                query_api
                display_books
                save_book
            elsif @input == 2
                puts "You entered 2"
            elsif @input == 3
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
    end

    # def user_input
    #     @input = gets.chomp
    # end

    def query_api
        puts "Please enter a search term."
        query = gets.chomp
        api = Api.new(query)
        api.create_books
    end

    def display_books
        # limit to only showing 5 books on subsequent queries
        Book.all.each_with_index {|book, index| book.show_book(index)}
    end

    def save_book 
        puts "Would you like to save one of these books? (y/n)"
        save = gets.chomp.downcase
        if save == "n" 
            return 
        elsif save == "y"
            puts "Saving your book"
        end
    end
end