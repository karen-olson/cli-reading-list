class Book
    attr_accessor :title, :authors, :publisher, :saved, :query

    @@all = []

    def initialize(title:, authors:, publisher:, saved:, query:)
        @title = title
        @authors = authors
        @publisher = publisher
        @saved = saved
        @query = query
        @@all << self
    end

    def show_book(index)
        puts " "
        puts "[#{index+1}]"
        puts "Title: #{self.title}"
        puts "Written by: #{self.authors.join(", ")}"
        puts "Publisher: #{self.publisher}"
        puts " "
        puts "-----------------------"
    end

    def save
        self.saved = true
        puts " "
        puts "Saved #{self.title} to reading list."
        puts " "
    end

    def self.all
        @@all 
    end

    def self.find_by_query(query)
        books = Book.all.filter {|book| book.query == query}
        books[0..4]
    end

    def self.reading_list 
        saved_books = Book.all.filter {|book| book.saved == true}
        if saved_books.length == 0
            puts " "
            puts "Your reading list is empty. Select 1 to search for books."
            puts " "
        else
            puts " "
            puts "Here is your reading list:"
            saved_books.each_with_index {|book, index| book.show_book(index)}
        end
    end
end