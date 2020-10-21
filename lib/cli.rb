require 'pry'

class CLI

  def start
    puts "Welcome to the Quarantine Movie List Generator!"
    API.retrieve_movies
    self.list
  end

  def list
    sleep 1.5
    puts "Would you like to see a list of movies?"

    sleep 1.5
    puts "Type 'yes' to continue or any other key to exit."
    user_input = gets.strip.downcase

    sleep 1.5
    if user_input == "yes" || user_input == "y"
      puts "Great! Check 'em out:"

      display_list_of_movies
      sleep 1.5
      ask_user_for_movie_choice
    end
  end

      # if user_input == "yes" || user_input == "y"
      # puts "Are you interested in learning more? If so, enter the number next to the movie."

  def display_list_of_movies
    # access all of the movies
    # print each one out in numbered list
    Movie.all.each.with_index(1) do |movie, index|
      puts "#{index}. #{movie.title}"
    end
  end

  def ask_user_for_movie_choice
    puts "If there's a movie you'd like to learn more about, enter the associated number. Otherwise, press any key to exit."
    index = gets.strip.to_i - 1
    index.between?(0, Movie.all.length - 1)
    movie_instance = Movie.all[index]
  end



end
