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
    puts "Type 'yes' to continue or any other key to exit"
    user_input = gets.strip.downcase
    sleep 1.5
    if user_input == "yes" || user_input == "y"
      puts "Great! Check 'em out:"
      display_list_of_movies
      puts "Interested in learning more? Enter the number next to the movie you want to learn more about."


    else puts "Good! Go outside!"
    end
  end

    # if user_input == "yes" || user_input == "y"
      # puts "Are you interested in learning more? If so, enter the number next to the movie."


  def display_list_of_movies
    # access all of the movies
    # print each one out
    Movie.all.each do |movie|
      puts movie.title
  end
end

end
