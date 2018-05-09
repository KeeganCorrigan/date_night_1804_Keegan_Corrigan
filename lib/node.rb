require 'pry'

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

class BinarySearchTree
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
      return current_node.movie_score
    else
      current_node = current_node.right
      max(current_node)
    end
  end

  # I get a movie_score is not a defined method error. Which is... uh... weird, to say the least.

  def min(current_node = @root)
    if current_node.left == nil
      return current_node.movie_score
    else
      current_node = current_node.left
      min(current_node)
    end
  end
end

tree = BinarySearchTree.new

p tree.insert(61, "Bill & Ted's Excellent Adventure")
# => 0
p tree.insert(16, "Johnny English")
# => 1
p tree.insert(92, "Sharknado 3")
# => 1
p tree.insert(50, "Hannibal Buress: Animal Furnace")
# => 2

p tree.include?(16)

p tree.include?(72)



# max
# Which movie has the highest score in the list? What is it’s score?
#
# tree.max
# => {"Sharknado 3"=>92}

# min
# Which movie has the lowest score in the list? What is it’s score?
#
# tree.min
# => {"Johnny English"=>16}





    # elsif @root.left =! nil
    # elsif movie_score < @root.movie_score
    #   @root.left == nil
    #   @root.left = Node.new(movie_score, title)
    #   # else
    #   #   @current_node = @current_node.left
    #   #   insert(movie_score, title)
    #   # end
    # elsif movie_score > @current_node.movie_score
    #     @current_node.right == nil
    #     @current_node.right = Node.new(movie_score, title)
      # else
      #   @current_node = @current_node.right
      #   insert(movie_score,title)
#       end
#     end
#   end
# end

# tree = BinarySearchTree.new
#
# tree.insert(61)




#   def push(movie_score)
#     if @movie_score < movie_score
#       if (@right)
#         @right.push(movie_score)
#       else
#         @right = Node.new(movie_score)
#       end
#     else
#       if (@left)
#         @left.insert(movie_score)
#       else
#         @left = Node.new(movie_score)
#       end
#     end
#   end
# end

# def insert(movie_score)
#   if @movie_score == movie_score
#     return node
#   elsif movie_score < node.movie_score
#     insert (node.left, movie_score)
#   elsif movie_score > node.movie_score
#     insert (node.right, movie_score)
#   else
#     return node = Node.new(movie_score)
#   end
# end




# tree.insert(61, "Bill & Ted's Excellent Adventure")
#  => 0
# tree.insert(16, "Johnny English")
#  => 1
# tree.insert(92, "Sharknado 3")
#  => 1
# tree.insert(50, "Hannibal Buress: Animal Furnace")
#  => 2

# create a class called `node`
# node should have a property called next_node and a property called value.
# it should start as:
# node = Node.new(48)
# node.value (should return 48)
# node.next_node (should return nil)
# then you should have a method called add_node
# if you call node.add_node(78) and then call node.next_node it should return an instance of node. If you call node.next_node.value it should return 78.
