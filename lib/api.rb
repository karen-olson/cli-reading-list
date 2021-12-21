class Api
    attr_accessor :query

    def initialize(query)
        @query = query 
    end
    
    def fetch_books 
        # Fetch 5 books based on the user's query.
        # Projection=lite means that not all volume information is included in the response.
        url = "https://www.googleapis.com/books/v1/volumes?q=#{self.query}&maxResults=5&projection=lite"
        
        # Use httparty and json gems to make GET requests to a URL and parse the JSON responses.
        uri = URI(url)
        response = Net::HTTP.get(uri)
        books = JSON.parse(response)

        # Return the first 5 books (from a nested array under a key of "items")
        books["items"][0..4]
    end

    def create_books
        books = self.fetch_books.each do |book|
            Book.new(
                title: book["volumeInfo"]["title"],
                authors: book["volumeInfo"]["authors"] ? book["volumeInfo"]["authors"] : ["No authors listed"],
                publisher: book["volumeInfo"]["publisher"],
                saved: false,
                query: query
            )
        end
    end

end