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
        insert_new_node(current_node.left, movie_score, title, depth)
      end
    elsif movie_score > current_node.movie_score
      if current_node.right == nil
        current_node.right = Node.new(movie_score, title)
        return depth
      else
        insert_new_node(current_node.right, movie_score, title, depth)
      end
    end
  end

  def include?(current_node = @root, movie_score)
    if current_node.movie_score == movie_score
      return true
    elsif current_node.movie_score > movie_score
      if current_node.left == nil
        return false
      else
        include?(current_node.left, movie_score)
      end
    elsif current_node.movie_score < movie_score
      if current_node.right == nil
        return false
      else
        include?(current_node.right, movie_score)
      end
    end
  end

  def depth_of(current_node = @root, node_depth = 0, movie_score)
    if current_node == nil
      return nil
    elsif current_node.movie_score == movie_score
      return node_depth
    elsif current_node.movie_score > movie_score
      node_depth += 1
      depth_of(current_node.left, node_depth, movie_score)
    elsif current_node.movie_score < movie_score
      node_depth += 1
      depth_of(current_node.right, node_depth, movie_score)
    end
  end

  def max(current_node = @root)
    if current_node.right == nil
      movie_max_score = {}
      movie_max_score[current_node.title] = current_node.movie_score
      return movie_max_score
    else
      return max(current_node.right)
    end
  end

  def min(current_node = @root)
    if current_node.left == nil
      movie_min_score = {}
      movie_min_score[current_node.title] = current_node.movie_score
      return movie_min_score
    else
      return min(current_node.left)
    end
  end

  def sort(current_node = @root, movies_ascending_order = [])
    if current_node.left == nil
      movies_ascending_order << {current_node.title => current_node.movie_score}
    else
      sort(current_node.left, movies_ascending_order)
      movies_ascending_order << {current_node.title => current_node.movie_score}
    end
    if current_node.right != nil
      sort(current_node.right, movies_ascending_order)
    end
    return movies_ascending_order
  end

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
