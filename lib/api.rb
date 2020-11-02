require 'pry'

class API

  def self.retrieve_movies
    api_key = ENV['API_KEY']

    url = "https://api.themoviedb.org/3/discover/movie?api_key=#{api_key}&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    films_hash = JSON.parse(response)

    array_of_movies = films_hash["results"]

    array_of_movies.each do |movie_hash|
      movie = Movie.new
      movie.title = movie_hash["title"]
      movie.vote_average = movie_hash["vote_average"]
      movie.overview = movie_hash["overview"]
      movie.release_date = movie_hash["release_date"]
    end
  end
end
