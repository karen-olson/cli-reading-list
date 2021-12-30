require 'pry'

RSpec.describe Book do 
    before(:context) do 
        @unstoppable_moses = Book.new(
            title: "Unstoppable Moses",
            authors: ["Tyler James Smith"],
            publisher: "Flatiron Books",
            saved: false,
            query: "Flatiron Books"
        )

        @winger = Book.new(
            title: "Winger",
            authors: ["Andrew Smith"],
            publisher: "Simon & Schuster",
            saved: false,
            query: "Smith"
        )
    end

    it "#show_book prints the correct list item number, title, author/s, and publisher" do 
        expected_output = " \n[2]\nTitle: Unstoppable Moses\nWritten by: Tyler James Smith\nPublisher: Flatiron Books\n \n-----------------------\n"
        expect{ @unstoppable_moses.show_book(1) }.to output(expected_output).to_stdout
    end
    
    it "#save changes saved attribute to true and prints a message to the terminal" do 
        @unstoppable_moses.save
        expect(@unstoppable_moses.saved).to be true
        expect{ @unstoppable_moses.save }.to output(/Saved Unstoppable Moses to reading list./).to_stdout
    end
    
    it ".all returns a list of all book instances" do 
        expect(Book.all).to include(@unstoppable_moses)
        expect(Book.all).to include(@winger)
        expect(Book.all.length).to eq(2)
    end


    it "searches all book instances given a query"
    it "returns only 5 books for each query"
    it "returns the reading list of all saved books"
    it "notifies a user if their reading list is empty"
end