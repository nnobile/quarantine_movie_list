class CLI

  def start
    puts "Welcome to the Quarantine Movie List Generator!"
    API.retrieve_movies
    self.list
  end

  def list
    # give user the option to see list of movies
    puts "Would you like to see a list of movies?"
    puts "Type 'yes' to continue or any other key to exit"
    user_input = gets.strip.downcase

    # if the user says yes
    if user_input == "yes" || user_input == "y"
      puts "Great!"
      # display the list
      display_list_of_movies
      puts "Are you interested in learning more about this list? If so, enter the number associated with the movie."
    end

  end

  def display_list_of_movies
    # access all of the movies
    # print each one out
    Movie.all.each do |movie|
      puts movie.title
  end
end

end
