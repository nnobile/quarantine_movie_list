require 'pry'

class API

  def self.retrieve_movies
    url = "https://api.themoviedb.org/3/discover/movie?api_key=3cb858a27ba1fcb6f33f21f11e03295a&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false"
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
    movie.vote_average = movie_hash["vote_average"]
    movie.overview = movie_hash["overview"]
    movie.release_date = movie_hash["release_date"]



    end
  end
