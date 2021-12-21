class Cli 

    @@menu_options = ["search for books", "view reading list", "exit"]

    def initialize 
        @menu_selection = nil
        @current_query = nil
        @reading_list = []
    end

    def run
        greeting
        until @menu_selection == 3
            self.display_menu_options
            set_menu_selection
            if @menu_selection == 1
                query_api
                display_books
                if save_book? 
                    save_book
                end
                # binding.pry
            elsif @menu_selection == 2
                display_reading_list
            elsif @menu_selection == 3
                exit
            end
        end
    end

    def greeting 
        puts " "
        puts "Welcome to My Reading List."
        puts " "
    end

    def exit 
        puts " "
        puts "Thanks for using My Reading List. See you next time!"
        puts " "
    end

    def set_menu_selection
        input = gets.chomp.to_i 
        if !(input == 1 || input == 2 || input == 3)
            puts "Please enter a number between 1 and 3."
            set_menu_selection
        end
        @menu_selection = input
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
        @current_query = gets.chomp
        api = Api.new(@current_query)
        api.create_books
    end

    def display_books
        books = Book.find_by_query(@current_query)
        books.each_with_index {|book, index| book.show_book(index)}
    end

    def save_book?
        puts "Would you like to save one of these books? (Y/N)"
        input = gets.chomp.upcase
        if !(input == "Y" || input == "N")
            puts "Please enter Y for yes or N for no."
            input = gets.chomp.upcase
        end
        input == "Y" ? true : false
    end

    def save_book 
        puts "Which book would you like to save? (1-5)"
            index = gets.chomp.to_i - 1
            book = Book.find_by_query(@current_query)[index]
            book.save_to_reading_list
    end

    def display_reading_list
        Book.reading_list
    end
end