require 'pry'

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
            expected_output = " \n[2]\nTitle: Unstoppable Moses\nWritten by: Tyler James Smith\nPublisher: Flatiron Books\n \n-----------------------\n"
            expect{ @unstoppable_moses.show_book(1) }.to output(expected_output).to_stdout
        end
    end

    describe "#save" do 
        it "changes saved attribute to true" do
            @unstoppable_moses.save
            expect(@unstoppable_moses.saved).to be true
        end
        
        it "prints a message to the terminal" do
            expect{ @unstoppable_moses.save }.to output(/Saved Unstoppable Moses to reading list./).to_stdout
        end 
    end

    describe ".all" do 
        it "returns a list of all book instances" do 
            expect(Book.all).to include @unstoppable_moses
            expect(Book.all).to include @winger
            expect(Book.all.length).to eq 6
        end
    end
    
    describe ".find_by_query" do 
        it "returns an array with book instances that have matching query attributes" do 
            expect(Book.find_by_query("Smith").map{ |book| book.query == "Smith" }).to eq([true, true, true, true, true])
            expect(Book.find_by_query("Smith")[0]).to eq @unstoppable_moses
            expect(Book.find_by_query("Smith")[1]).to eq @winger
        end
 
        it "returns only 5 books for each query" do 
            expect(Book.find_by_query("Smith").length).to eq 5
        end
    end

    describe ".reading_list" do 
        it "returns an array containing all saved books" do 
            # Book.all.each { |book| book.save }
        end

        it "notifies a user if their reading list is empty"
    end
end