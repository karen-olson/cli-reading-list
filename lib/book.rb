class Book
    attr_accessor :title, :authors, :publisher, :saved, :query, :saved_books, :queried_books

    @@saved_books = []
    @@queried_books = []

    def initialize(title:, authors:, publisher:, saved:, query:)
        @title = title
        @authors = authors
        @publisher = publisher
        @saved = saved
        @query = query
        @@queried_books << self
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
        @@saved_books << self
        puts " "
        puts "Saved #{self.title} to reading list."
        puts " "
    end

    def self.queried_books
        @@queried_books[0..4]
    end

    def self.set_queried_books(value)
        @@queried_books = value
    end

    def self.reading_list
        if @@saved_books.length == 0
            puts " "
            puts "Your reading list is empty. Select 1 to search for books."
            puts " "
        else
            puts " "
            puts "Here is your reading list:"
            @@saved_books.each_with_index {|book, index| book.show_book(index)}
        end
    end
end