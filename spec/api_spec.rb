RSpec.describe Api do
    before(:context) do 
        @lowercase = Api.new("dogs")
        @uppercase = Api.new("DOGS")
        @hyphen = Api.new("blast-off")
        @full_sentence = Api.new("Hi my name is Karen, and I'd like to search for books.")
        @hashtag = Api.new("#dogs")
        @space = Api.new(" ")
        @emoji = Api.new("🧐")
        @nonsense_word = Api.new("dfsdergkljerlk")
        @missing_api_info = Api.new("llama")
    end

    describe "#fetch_books" do
        it "raises an error when given invalid input" do 
            expect{ @hashtag.fetch_books }.to raise_error(StandardError)
            expect{ @space.fetch_books }.to raise_error(StandardError)
            expect{ @emoji.fetch_books }.to raise_error(StandardError)
            expect{ @nonsense_word.fetch_books }.to raise_error(StandardError)
        end

        it "returns 5 books when given valid input" do 
            expect(@lowercase.fetch_books.length).to be 5
            expect(@uppercase.fetch_books.length).to be 5
            expect(@hyphen.fetch_books.length).to be 5
            expect(@full_sentence.fetch_books.length).to be 5
        end 
    end

    describe "#create_books" do 
        it "creates 5 books" do 
            books = @lowercase.create_books 
            expect(Book.queried_books.length).to be 5
        end
        
        it "returns an error if it receives an invalid api response" do 
            expect(@hashtag.create_books).to be_a(StandardError)
            expect(@emoji.create_books).to be_a(StandardError)
        end
        
        it "returns a book if the API response has missing information" do 
            books = @missing_api_info.create_books
            expect(Book.queried_books.length).to be 5
        end
        
    end
end