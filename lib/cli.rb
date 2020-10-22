require 'pry'

class CLI

  def start
    puts "Welcome to the Quarantine Movie List Generator!".blue
    API.retrieve_movies
    self.list
  end

  def list
    sleep(1.5)
    puts "Would you like to see a list of movies?".blue

    sleep(1.5)
    puts "Type 'yes' to continue or any other key to exit.".blue

    user_input = gets.strip.downcase

    sleep(1.5)
    if user_input == "yes" || user_input == "y"

      puts "Great! Check 'em out:".green

      display_list_of_movies
      ask_user_for_movie_choice

      sleep(2)
      puts "\n"

      list
    end
  end


  def display_list_of_movies
    Movie.all.each.with_index(1) do |movie, index|
      puts "#{index}. #{movie.title}"
    end
  end

  def ask_user_for_movie_choice
    puts "If there's a movie you'd like to learn more about, enter the associated number. Otherwise, press any key to exit."
    index = gets.strip.to_i - 1

    until index.between?(0, Movie.all.length - 1)
      puts "Sorry, that's an invalid entry. Please try again."
      index = gets.strip.to_i - 1
    end

    movie_instance = Movie.all[index]

    display_movie_details(movie_instance)

  end

  def display_movie_details(movie)
    sleep(1.5)
    puts "\n"
    puts movie.title
    puts "Vote Average: " + movie.vote_average
    puts "Overview: " + movie.overview
    puts "Release Date: " + movie.release_date
  end

end
