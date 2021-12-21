class Book
    attr_accessor :title, :authors, :publishing_company, :saved, :query

    @@all = []

    def initialize(title, authors, publishing_company, saved, query)
        @title = title
        @authors = authors
        @publishing_company = publishing_company
        @saved = false
        @query = query
        @@all << self
    end

    def self.all
        @@all 
    end

    def show_book(index)
        puts " "
        puts "[#{index+1}]"
        puts "Title: #{self.title}"
        puts "Written by: #{self.authors.join(", ")}"
        puts "Publisher: #{self.publishing_company}"
        puts " "
        puts "-----------------------"
    end

    def self.find_by_query(query)
        books = Book.all.filter {|book| book.query == query}
        books[0..4]
    end

    def save_to_reading_list 
        self.saved = true
        puts " "
        puts "Saved #{self.title} to reading list."
        puts " "
    end

    def self.reading_list 
        puts " "
        puts "Here is your reading list:"
        saved_books = Book.all.filter {|book| book.saved == true}
        saved_books.each_with_index {|book, index| book.show_book(index)}
    end
end