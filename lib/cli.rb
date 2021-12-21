class Cli 

    @@menu_options = ["search for books", "view reading list", "exit"]

    def initialize 
        @menu_selection = nil
        @current_query = nil
        @reading_list = []
    end

    def run
        greeting
        menu
        exit
    end

    def greeting 
        puts " "
        puts "Welcome to My Reading List."
        puts " "
    end

    def menu
        until @menu_selection == 3 
            display_menu_options
            set_menu_selection
            if @menu_selection == 1 # Option 1: "Search for books"
                query_api
                display_books
                if save_book? # Ask the user if they want to save a book.
                    save_book # If so, select a book and save it to the reading list.
                end
            elsif @menu_selection == 2 # Option 2: "View reading list"
                display_reading_list
            elsif @menu_selection == 3 # Option 3: "Exit"
                break
            end
        end
    end



    ### MENU DISPLAY AND NAVIGATION

    def self.menu_options 
        @@menu_options
    end

    def display_menu_options
        puts "Please choose an option: (1-3)"
        puts " "
        Cli.menu_options.each_with_index{|option, index| puts "#{index+1}. #{option.capitalize}"}
        puts " "
    end

    def set_menu_selection
        input = gets.chomp.to_i 
        until (1..3).include?(input)
            puts "Please enter a number between 1 and 3."
            input = gets.chomp.to_i
        end
        @menu_selection = input
    end



    ### MENU OPTION 1: Search for books

    def query_api
        puts "Please enter a search term."
        @current_query = gets.chomp
        api = Api.new(@current_query)
        api.create_books
    end

    def display_books
        # Because the Book class contains book instances from all queries the user has made,
        #    only display the books that match the current query.
        books = Book.find_by_query(@current_query)
        books.each_with_index {|book, index| book.show_book(index)}
    end



    ### MENU OPTION 1 - SUBMENU: Save books to the reading list

    # First, see whether the user wants to save a book.
    def save_book?
        puts "Would you like to save one of these books? (Y/N)"
        input = gets.chomp.upcase
        until ["Y", "N"].include?(input)
            puts "Please enter Y for yes or N for no."
            input = gets.chomp.upcase
        end
        input == "Y" ? true : false
    end

    # If so, save their selected book.
    def save_book 
        puts "Which book would you like to save? (1-5)"
        input = gets.chomp.to_i
        until (1..5).include?(input)
            puts "Please enter a number between 1 and 5."
            input = gets.chomp.to_i
        end
        # Because the Book class saves all book instances the Api has created so far, 
        #    look for the book's index in the subset of books that match the current query.
        book = Book.find_by_query(@current_query)[input-1]
        book.save
    end



    ### MENU OPTION 2: Viewing the reading list

    def display_reading_list
        Book.reading_list
    end



    ### MENU OPTION 3: Exiting the program

    def exit 
        puts " "
        puts "Thanks for using My Reading List. See you next time!"
        puts " "
    end
end