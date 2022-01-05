RSpec.describe Cli do
    before(:context) do 
        @cli = Cli.new
    end

    describe "#set_menu_selection" do
        it "only accepts numbers 1-3" do 
            # how to mock user input when testing?
            @cli.set_menu_selection
            # binding.pry
        end
        
        it "continues prompting the user until it receives valid input (numbers 1-3)"
    end

    describe "#validate_query_results" do
        it "raises an exception if the query results return a StandardError"
    end

    describe "#save_book?" do
        it "is not case-sensitive"

        it "only accepts Y, N, y, and n"
        
        it "continues prompting the user until it receives valid input"
    end

    describe "#add_to_reading_list" do
        it "only accepts numbers 1-5"
        
        it "continues prompting the user until it receives valid input (numbers 1-5)"
    end
end