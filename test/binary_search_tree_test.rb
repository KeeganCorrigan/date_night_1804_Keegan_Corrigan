require 'minitest/autorun'
require 'minitest/pride'
require './lib/binary_search_tree'
require 'simplecov'
SimpleCov.start

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

  def test_insert_method
    tree = BinarySearchTree.new
    assert_equal 0, tree.insert(61, "Bill & Ted's Excellent Adventure")
    assert_equal 1, tree.insert(16, "Johnny English")
    assert_equal 1, tree.insert(92, "Sharknado 3")
    assert_equal 2, tree.insert(50, "Hannibal Buress: Animal Furnace")
    assert_equal 3, tree.insert(55, "The edge case")
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
    assert_equal 1, tree.depth_of(92)
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

  def test_it_loads_a_text_file_and_increments_counter_per_movie_inserted_into_tree
    tree = BinarySearchTree.new
    assert_equal 99, tree.load('./lib/movies.txt')
  end
end
