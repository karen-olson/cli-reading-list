RSpec.describe Book do 
    before(:context) do 
        @unstoppable_moses = Book.new(
            title: "Unstoppable Moses",
            authors: ["Tyler James Smith"],
            publisher: "Flatiron Books",
            saved: false,
            query: "Smith"
        )

        @winger = Book.new(
            title: "Winger",
            authors: ["Andrew Smith"],
            publisher: "Simon & Schuster",
            saved: false,
            query: "Smith"
        )

        @stand_off = Book.new(
            title: "Stand-Off",
            authors: ["Andrew Smith"],
            publisher: "Simon & Schuster",
            saved: false,
            query: "Smith"
        )

        @grasshopper_jungle = Book.new(
            title: "Grasshopper Jungle",
            authors: ["Andrew Smith"],
            publisher: "Dutton Books",
            saved: false,
            query: "Smith"
        )
        
        @stick = Book.new(
            title: "Stick",
            authors: ["Andrew Smith"],
            publisher: "Feiwel & Friends",
            saved: false,
            query: "Smith"
        )
        
        @the_marbury_lens = Book.new(
            title: "The Marbury Lens",
            authors: ["Andrew Smith"],
            publisher: "Feiwel & Friends",
            saved: false,
            query: "Smith"
        )
    end

    describe "#show_book" do 
        it "prints the correct list item number, title, author/s, and publisher" do 
            expected_output = " \n[1]\nTitle: Unstoppable Moses\nWritten by: Tyler James Smith\nPublisher: Flatiron Books\n \n-----------------------\n"
            expect{ @unstoppable_moses.show_book(0) }.to output(expected_output).to_stdout
        end
    end

    describe ".queried_books" do 
        it "returns only 5 books for each query" do 
            expect(Book.queried_books.length).to eq 5
        end
    end 
    
    describe ".reading_list" do 
        it "prints a message to the terminal if the reading list is empty (no books are saved)" do 
            expect{Book.reading_list}.to output(/Your reading list is empty. Select 1 to search for books./).to_stdout
        end
        
        it "returns an array containing the correct number of saved books" do
            @unstoppable_moses.save
            @winger.save 
            @stand_off.save
            expect(Book.reading_list.length).to eq 3
        end
    end

    describe "#save" do         
        it "changes the book's saved attribute to true" do
            expect(@unstoppable_moses.saved).to be true
        end

        it "prints a confirmation message to the terminal" do
            expect{ @unstoppable_moses.save }.to output(/Saved Unstoppable Moses to reading list./).to_stdout
        end 
    end
end
