require 'pry'

class CLI

  def start
    puts "Welcome to the Quarantine Movie List Generator!".cyan.underline
    API.retrieve_movies
    self.list
  end

  def list
    sleep(1)
    puts "Would you like to see a list of movies?".cyan

    sleep(1)
    puts "Type 'yes' or 'y' to continue. Or, enter any other key to exit.".cyan

    user_input = gets.strip.downcase

    sleep(1)
    if user_input == "yes" || user_input == "y"

      puts "Great! Check 'em out:".green
      puts "\n"
      display_list_of_movies
      puts "\n"
      ask_user_for_movie_choice

      sleep(2)
      puts "\n"

      list
    else
      puts "Good! Go outside!"

    end
  end


  def display_list_of_movies
    Movie.all.each.with_index(1) do |movie, index|
      puts "#{index}. #{movie.title}"
    end
  end

  def ask_user_for_movie_choice
    puts "If there's a movie you'd like to learn more about, enter the associated number.".green
    index = gets.strip.to_i - 1

    until index.between?(0, Movie.all.length - 1)
      puts "Sorry, invalid entry. Please choose a number between 1 and 20.".red
      index = gets.strip.to_i - 1

    end
    movie_instance = Movie.all[index]
    display_movie_details(movie_instance)
  end

  def display_movie_details(movie)
    sleep(1.5)
    puts "\n"
    puts "Movie Title: #{movie.title}"
    puts "Vote Average: #{movie.vote_average}"
    puts "Overview: #{movie.overview}"
    puts "Release Date: #{movie.release_date}"
  end

end
