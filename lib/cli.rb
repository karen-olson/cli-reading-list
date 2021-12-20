class Cli 

    def initialize 
        @input = nil
        @reading_list = []
    end

    def run
        hello
        query_api
        goodbye
    end

    def hello
        puts "Welcome to My Reading List."
    end

    def user_input
        @input = gets.chomp
    end

    def query_api
        puts "Please enter a search term to look for books."
        user_input
        api = Api.new(@input)
    end

    def goodbye 
        puts "Thanks for using My Reading List. See you next time!"
    end
end