class API

  def self.retrieve_movies
    url = #placeholder URL
    uri = URI(url)
    response = Net::HTTP.get(uri)
    hash = JSON.parse(reponse)

    array_of_movies = hash["movies"]

    array_of_movies.each do |movies_hash|
      movie = Movie.new
      movie.name = movie_hash[]
      movie.rating = movie_hash[]
    end
  end
  
end
