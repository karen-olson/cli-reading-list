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
end