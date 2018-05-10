require 'minitest/autorun'
require 'minitest/pride'
require './lib/binary_search_tree'
require 'pry'

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

  def test_insert_method_assigns_right_node
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

  def test_insert_new_node_depth
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

  def test_include_method
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")
    assert_equal true, tree.include?(16)
    assert_equal false, tree.include?(72)
    assert_equal false, tree.include?(100)
    assert_equal true, tree.include?(50)
  end

  def test_depth_of_method
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")
    assert_equal 0, tree.depth_of(61)
    assert_equal 1, tree.depth_of(16)
    assert_equal 2, tree.depth_of(50)
    assert_nil(tree.depth_of(5), nil)
    assert_nil(tree.depth_of(80), nil)
  end

  def test_for_max
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")

    expected = {"Sharknado 3"=>92}

    assert_equal expected, tree.max
  end

  def test_for_min
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")

    expected = {"Johnny English"=>16}

    assert_equal expected, tree.min
  end

  def test_sort_works_for_1_movie
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")

    expected = [{"Bill & Ted's Excellent Adventure"=>61}]

    assert_equal expected, tree.sort
  end

  def test_sort_works_for_2_movies_on_left
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")

    expected = [{"Johnny English"=>16}, {"Bill & Ted's Excellent Adventure"=>61}]

    assert_equal expected, tree.sort
  end

  def test_sort_works_for_1_movie_on_right
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(92, "Sharknado 3")

    expected = [{"Bill & Ted's Excellent Adventure"=>61}, {"Sharknado 3"=>92}]

    assert_equal expected, tree.sort
  end

  def test_sort
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")

    expected = [{"Johnny English"=>16},
  {"Hannibal Buress: Animal Furnace"=>50},
  {"Bill & Ted's Excellent Adventure"=>61},
 {"Sharknado 3"=>92}]

    assert_equal expected, tree.sort
  end

  def test_it_loads_a_text_file_and_increments_counter_per_movie_inserted
    tree = BinarySearchTree.new
    assert_equal 99, tree.load('./lib/movies.txt')
  end
end
