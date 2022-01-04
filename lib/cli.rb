class Cli 

    @@menu_options = ["search for books", "view reading list", "exit"]

    @@search_for_books = 1
    @@view_reading_list = 2
    @@exit_cli = 3

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
        until @menu_selection == @@exit_cli
            display_menu_options
            set_menu_selection
            if @menu_selection == @@search_for_books
                query_api
                display_query_results
                if save_book?
                    add_to_reading_list
                end
            elsif @menu_selection == @@view_reading_list
                display_reading_list
            elsif @menu_selection == @@exit_cli
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
        puts " "
        puts "Please enter a search term."
        puts " "
        @current_query = gets.chomp
        api = Api.new(@current_query)
        api.create_books
    end

    def display_query_results
        query_results = Book.find_by_query(@current_query)
        query_results.each_with_index {|book, index| book.show_book(index)}
    end



    ### MENU OPTION 1 - SUBMENU: Save books to the reading list

    def save_book?
        puts "Would you like to save one of these books? (Y/N)"
        input = gets.chomp.upcase
        until ["Y", "N"].include?(input)
            puts "Please enter Y for yes or N for no."
            input = gets.chomp.upcase
        end
        input == "Y" ? true : false
    end

    def add_to_reading_list
        puts "Which book would you like to save? (1-5)"
        input = gets.chomp.to_i
        until (1..5).include?(input)
            puts "Please enter a number between 1 and 5."
            input = gets.chomp.to_i
        end

        selected_book = Book.find_by_query(@current_query)[input-1]
        selected_book.save
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