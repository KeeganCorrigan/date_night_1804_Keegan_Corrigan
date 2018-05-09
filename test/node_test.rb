require 'minitest/autorun'
require 'minitest/pride'
require './lib/node'

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
