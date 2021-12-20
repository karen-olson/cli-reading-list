class Cli 

    @@menu_options = ["search for books", "view reading list", "exit"]

    def initialize 
        @input = nil
        @reading_list = []
    end

    def run
        puts "Welcome to My Reading List."

        until @input == 3
            self.display_menu_options
            @input = gets.chomp.to_i 
            binding.pry
        end
        
        # puts "Please enter a search term to look for books."
        # query_api

        puts "Thanks for using My Reading List. See you next time!"
    end

    def self.menu_options 
        @@menu_options
    end

    def display_menu_options
        Cli.menu_options.each_with_index{|option, index| puts "#{index+1}. #{option.capitalize}"}
    end

    # def user_input
    #     @input = gets.chomp
    # end

    def query_api
        user_input
        api = Api.new(@input)
    end
end