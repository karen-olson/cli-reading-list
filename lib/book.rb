class Book
    attr_accessor :title, :authors, :publishing_company

    @@all = []

    def initialize(title, authors, publishing_company)
        @title = title
        @authors = authors
        @publishing_company = publishing_company
        @@all << self
    end

    def self.all
        @@all 
    end
end