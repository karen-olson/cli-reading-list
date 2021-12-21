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
        puts "Author: #{self.authors.join(" ")}"
        puts "Publisher: #{self.publishing_company}"
        puts " "
        puts "-----------------------"
    end

    def self.find_by_query(query)
        books = Book.all.filter {|book| book.query == query}
        books[0..4]
    end

    def save_to_reading_list 
        puts " "
        puts "Saving #{self.title} to reading list"
        puts " "
        self.saved = true
    end
end