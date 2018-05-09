require 'minitest/autorun'
require 'minitest/pride'
require './lib/node'
require 'pry'

class NodeTest < Minitest::Test
  def test_node_exists
    node = Node.new(12, "string")
    assert_instance_of(Node, node)
  end

  def test_node_has_movie_score
    node = Node.new(12, "string")
    assert_equal 12, node.movie_score
  end

  def test_node_has_title
    node = Node.new(12, "string")
    assert_equal "string", node.title
  end
end

class BinarySearchTreeTest < Minitest::Test
  def test_Binary_search_tree_can_be_initialized
    tree = BinarySearchTree.new
    assert_instance_of(BinarySearchTree, tree)
  end

  def test_root_is_nil
    tree = BinarySearchTree.new
    assert_nil tree.root
  end

  def test_insert_method_sets_root
    tree = BinarySearchTree.new
    tree.insert(12, "String")
    assert_instance_of(Node, tree.root)
  end

  def test_root_has_movie_score
    tree = BinarySearchTree.new
    tree.insert(12, "String")
    assert_equal 12, tree.root.movie_score
  end

  def test_insert_method_assigns_left_node
    tree = BinarySearchTree.new
    tree.insert(12, "String")
    tree.insert(10, "Second String")
    assert_equal 10, tree.root.left.movie_score
  end

  def test_insert_method_assigns_two_left_nodes
    tree = BinarySearchTree.new
    tree.insert(12, "String")
    tree.insert(10, "Second String")
    tree.insert(15, "Third String")
    assert_equal 15, tree.root.right.movie_score
  end

  def test_insert_method_assigns_left_left_node
    tree = BinarySearchTree.new
    tree.insert(12, "String")
    tree.insert(10, "Second String")
    tree.insert(15, "Third String")
    tree.insert(9, "Fourth String")
    assert_equal 9, tree.root.left.left.movie_score
  end

  def test_insert_method_assigns_left_left_left_node
    tree = BinarySearchTree.new
    tree.insert(12, "String")
    tree.insert(10, "Second String")
    tree.insert(15, "Third String")
    tree.insert(9, "Fourth String")
    tree.insert(8, "Fifth String")
    assert_equal 8, tree.root.left.left.left.movie_score
  end

  def test_insert_method_assigns_right_right_node
    tree = BinarySearchTree.new
    tree.insert(12, "String")
    tree.insert(15, "Third String")
    tree.insert(18, "Thirs String")
    assert_equal 18, tree.root.right.right.movie_score
  end

  def test_insert_method_assigns_right_right_node
    tree = BinarySearchTree.new
    tree.insert(12, "String")
    tree.insert(15, "Third String")
    tree.insert(10, "second String")
    tree.insert(18, "Thirs String")
    assert_equal 18, tree.root.right.right.movie_score
  end

  def test_insert_method_assigns_right_right_right_node
    tree = BinarySearchTree.new
    tree.insert(12, "String")
    tree.insert(15, "Third String")
    tree.insert(10, "second String")
    tree.insert(18, "Thirs String")
    tree.insert(20, "A different film")
    assert_equal 20,  tree.root.right.right.right.movie_score
  end

  # def test_depth_of_root_node_is_0
  #   tree = BinarySearchTree.new
  #   tree.insert(12, "String")
  #   assert_equal 0, tree.depth
  # end
  #
  def test_insert_new_node_depth_returns_zero
    tree = BinarySearchTree.new
    assert_equal 0, tree.insert(12, "String")
  end

  def test_insert_new_node_increments_to_1
    tree = BinarySearchTree.new
    tree.insert(12, "String")
    assert_equal 1, tree.insert(24, "Stringnig")
  end

  def test_insert_new_node_increments_to_2
    tree = BinarySearchTree.new
    tree.insert(12, "String")
    tree.insert(24, "Stringnig")
    assert_equal 2, tree.insert(34, "Stringy the third")
  end

  def test_insert_new_node_increments_correctly_left_and_right
    tree = BinarySearchTree.new
    tree.insert(12, "String")
    tree.insert(24, "Stringnig")
    tree.insert(10, "Stringy the third")
    tree.insert(8, "Stringy the third")
  end
end

  # def test_first_insert_root
  #   tree = BinarySearchTree.new
  #   tree.insert(12, "String")
  #   assert_instance_of(Node, tree.root)
  # end
  #
  # def test_insert_second_lower_node
  #   tree = BinarySearchTree.new
  #   tree.insert(12, "String")
  #   tree.insert(10, "Second String")
  #   assert_equal 12, tree.root.movie_score
  #   assert_equal 10, tree.root.left.movie_score
  # end
  #
  # def test_insert_second_higher_node
  #   tree = BinarySearchTree.new
  #   tree.insert(12, "String")
  #   tree.insert(13, "Third String")
  #   assert_equal 12, tree.root.movie_score
  #   assert_equal 13, tree.root.right.movie_score
  # end
  #
  # def test_inserting_several_nodes
  #   tree = BinarySearchTree.new
  #   tree.insert(61, "B")
  #   tree.insert(16, "John")
  #   tree.insert(92, "Sharknado 3")
  #   tree.insert(50, "Hannibal")
  #   assert_equal 50, tree.root.left.right.movie_score
  # end
