RSpec.describe Api do
    before(:context) do 
        @api_instances = {
            dogs: Api.new("dogs"),
            hashtag_dogs: Api.new("#dogs")
        }
        # @baby_stuff = Api.new("snails")
        # @blast_off = Api.new("blast-off")
        # @full_sentence = Api.new("Hi my name is Karen, and I'd like to search for books.")
        # @space = Api.new(" ")
        # @emoji = Api.new("🧐")
        # @nonsense_word = Api.new("dfsdergkljerlk")
    end

    describe "#fetch_books" do
        it "raises an error when given invalid input" do 
            # call fetch_books on space, emoji, nonsense word
            # see if the return value is an error
        end

        it "returns 5 books" do 
            returns_5_books = @api_instances.map do |query, api_instance|
                books = api_instance.fetch_books
                expect(books.length).to be 5
            end

            expect(returns_5_books).not_to include false
        end 
    end

    describe "#create_books" do 
        it "creates 5 books"

        it "raises an error if it receives an invalid api response"

        it "returns `No authors listed.`if the API does not contain an authors key"

    end
end