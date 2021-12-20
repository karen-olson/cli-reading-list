class Book
    attr_accessor :title, :authors, :publishing_company, :saved

    @@all = []

    def initialize(title, authors, publishing_company, saved)
        @title = title
        @authors = authors
        @publishing_company = publishing_company
        @saved = false
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
end