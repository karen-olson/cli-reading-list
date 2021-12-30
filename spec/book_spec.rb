require 'pry'

describe Book do 
    let(:unstoppable_moses) do 
        Book.new(
            title: "Unstoppable Moses",
            authors: ["Tyler James Smith"],
            publisher: "Flatiron Books",
            saved: false,
            query: "Flatiron Books"
        )
    end

    it "prints the correct list item number, title, author/s, and publisher" do 
        expected_output = " \n[2]\nTitle: Unstoppable Moses\nWritten by: Tyler James Smith\nPublisher: Flatiron Books\n \n-----------------------\n"
        expect{ unstoppable_moses.show_book(1) }.to output(expected_output).to_stdout
    end

    it "can be saved" do 
        unstoppable_moses.save 
        expect(unstoppable_moses.saved).to be_true
    end
    
    it "returns a list of all book instances"
    it "searches all book instances given a query"
    it "returns only 5 books for each query"
    it "returns the reading list of all saved books"
    it "notifies a user if their reading list is empty"
end