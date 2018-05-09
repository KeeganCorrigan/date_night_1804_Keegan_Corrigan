require 'pry'

class BinarySearchTree
  require './lib/node.rb'
  attr_accessor :root

  def initialize
    @root = nil
  end

  def insert(movie_score, title)
    if @root == nil
      @root = Node.new(movie_score, title)
      return 0
    else
      insert_new_node(root, movie_score, title, depth = 0)
    end
  end

  def insert_new_node(current_node = @root, movie_score, title, depth)
    depth += 1
    if movie_score < current_node.movie_score
      if current_node.left == nil
        current_node.left = Node.new(movie_score, title)
        return depth
      else
        current_node = current_node.left
        insert_new_node(current_node, movie_score, title, depth)
      end
    elsif movie_score > current_node.movie_score
      if current_node.right == nil
        current_node.right = Node.new(movie_score, title)
        return depth
      else
        current_node = current_node.right
        insert_new_node(current_node, movie_score, title, depth)
      end
    else
      return
    end
  end

  def include?(current_node = @root, movie_score)
    if current_node.movie_score == movie_score
      return true
    elsif current_node.movie_score > movie_score
      if current_node.left == nil
        return false
      else
        current_node = current_node.left
        include?(current_node, movie_score)
      end
    elsif current_node.movie_score < movie_score
      if current_node.right == nil
        return false
      else
        current_node = current_node.right
        include?(current_node, movie_score)
      end
    end
  end

  # depth_of doesn't deal with nil values well right now

  def depth_of(current_node = @root, node_depth = 0, movie_score)
    if current_node.movie_score == movie_score
      return node_depth
    elsif current_node == nil
      return nil
    elsif current_node.movie_score > movie_score
      current_node = current_node.left
      node_depth += 1
      depth_of(current_node, node_depth, movie_score)
    elsif current_node.movie_score < movie_score
      current_node = current_node.right
      node_depth += 1
      depth_of(current_node, node_depth, movie_score)
    end
  end

  # I get a movie_score is not a defined method error. Which is... uh... weird, to say the least.


  def max(current_node = @root)
    if current_node.right == nil
      movie_max_score = {}
      movie_max_score[current_node.title] = current_node.movie_score
      return movie_max_score
    else
      current_node = current_node.right
      max(current_node)
    end
  end

  def min(current_node = @root)
    if current_node.left == nil
      movie_min_score = {}
      movie_min_score[current_node.title] = current_node.movie_score
      return movie_min_score
    else
      current_node = current_node.left
      min(current_node)
    end
  end

  # def sort(current_node = @root, movies_ascending_order = [])
  #   # Checkes if the node to the left of the current_node is nil and inserts it into array
  #   if current_node.left == nil
  #     movies_ascending_order << {current_node.title => current_node.movie_score}
  #   else
  #     #sends the left of the current node back into the function, until the current_node.left is nil. This means every node along the path is checking to see if it has a number that is nil. Once it's completed that part of the function it inserts the node values into the movies_ascending_order array as a hash.
  #     sort(current_node.left, movies_ascending_order)
  #     movies_ascending_order << {current_node.title => current_node.movie_score}
  #   end
  #   # This part of the function has ended, so the nodes that have completed the first if/else will check the node to their right and run the sort function on those nodes.
  #   if current_node.right =! nil
  #     sort(current_node.right, movies_ascending_order)
  #   end
  #   # return movies_ascending_order
  # end


  def load(movie_list)
    counter = 0
    File.readlines(movie_list).each do |movies|
      movie_to_insert = movies.chomp.split(", ")
      insert(movie_to_insert[0].to_i, movie_to_insert[1].to_s)
      counter += 1
    end
    return counter
  end
end


# load
# Assuming we have a file named movies.txt with one score/movie pair per line:
#
# # movies.txt sample format:
# 34, Hannibal Buress: Comedy Camisado
# 63, Meet My Valentine
# 22, Experimenter
# 84, French Dirty
# 41, Love
# 10, I Love You Phillip Morris
# tree.load('movies.txt')
# # => 99
# Where the return value is the number of movies inserted into the tree. If a score is already present in the tree when load is called, ignore it.
