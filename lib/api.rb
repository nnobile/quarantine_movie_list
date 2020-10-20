require 'pry'

class API

  def self.retrieve_movies
    url = "https://api.themoviedb.org/3/movie/2?api_key=3cb858a27ba1fcb6f33f21f11e03295a&language=en-US"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    movie_hash = JSON.parse(response)

    # array_of_movies = hash["movies"]
    #
    # array_of_movies.each do |movies_hash|
    #   movie = Movie.new
    #   movie.title = movie_hash["title"]
    #   movie.overview = movie_hash["overview"]
    #   movie.release_date = movie_hash["release_date"]

    movie = Movie.new
    movie.title = movie_hash["title"]
    movie.overview = movie_hash["overview"]
    movie.release_date = movie_hash["release_date"]



    end
  end
