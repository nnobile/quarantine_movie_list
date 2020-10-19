class Movie
  attr_accessor :title, :director, :cast, :review

  @@all = []

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end


end
