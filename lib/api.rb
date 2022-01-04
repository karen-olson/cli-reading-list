class Api
    attr_accessor :query

    def initialize(query)
        @query = query 
    end

    def fetch_books 
        # Projection=lite means that the API response omits some details.
        url = "https://www.googleapis.com/books/v1/volumes?q=#{self.query}&maxResults=5&projection=lite"
        
        # Use httparty and json gems to make GET requests to a URL and parse the JSON responses.
        uri = URI(url)
        response = Net::HTTP.get(uri)
        books = JSON.parse(response)

        books["error"] ? raise("Invalid input. Please try a different query.") : first_five_books = books["items"][0..4]
    end

    def create_books
        begin
            books = self.fetch_books
        rescue => exception
            return exception
        else            
            formatted_books = books.each do |book|
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

end