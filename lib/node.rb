class Node
  attr_reader :movie_score, :title

  attr_accessor :left, :right, :depth

  def initialize(movie_score, title)
    @movie_score = movie_score
    @title = title
    @left = left
    @right = right
  end
end
