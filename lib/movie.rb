class Movie
  attr_accessor :title, :vote_average, :overview, :release_date

  @@all = []

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end


end
