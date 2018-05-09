class BinarySearchTree

  attr_accessor :data, :left, :right

  def initialize(data)
    @data = data
    @right = nil
    @left = nil
  end

  def insert(data)
    if  @data < data
      if (self.right )
        @right.insert(data)
      else
        @leftright = BinarySearchTree.new(data)
      end
    else
      if (@left)
        @left.insert(data)
      else
        @left = BinarySearchTree.new(data)
      end
    end
  end
end

tree = BinarySearchTree.new(60)

p tree

# class Bst
#
#   attr_accessor :data, :left, :right
#
#   def initialize(data)
#     self.data = data
#   end
#
#   def insert(data)
#     if  self.data < data
#       if (self.right )
#         self.right.insert(data)
#       else
#         self.right = Bst.new(data)
#       end
#     else
#       if (self.left )
#         self.left.insert(data)
#       else
#         self.left = Bst.new(data)
#       end
#     end
#   end
