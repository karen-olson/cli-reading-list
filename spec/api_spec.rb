RSpec.describe Api do
    # create different instances of Api class with different queries
    # test #fetch_books given each query
    # test #create_books given each query (decouple from #fetch_books)

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

        # def mock_create_books(books)
        #     books.map { |book| {
        #         title: book["volumeInfo"]["title"],
        #         authors: book["volumeInfo"]["authors"],
        #         publisher: book["volumeInfo"]["publisher"],
        #     }}
        # end

    describe "#fetch_books" do
        it "returns 5 books" do 
            returns_5_books = @api_instances.map do |query, api_instance|
                books = api_instance.fetch_books
                expect(books.length).to be 5
            end
            
            expect(returns_5_books).not_to include false
        end 

        # it "returns books with valid titles" do 
        #     call mock_create_books
        #     expect title to exist, to be a type of string
        # end 
    end
end