# Write a function that will traverse an unbalanced, unsorted binary tree, looking for a node with a specific value. Your function should return a pointer to that node.

# class BinaryTreeNode
#   @val =
#   def find(val)
#     # search
#   end
# end
module BinaryTree
  class Node
    attr_accessor :value, :left, :right
    
    def initialize(val = nil)
      @value = val
    end
    
    def insert(val)
      case value <=> val
      when 1 then insert_left(val)
      when -1 then insert_right(val)
      end
    end
    
    def insert_left(val)
      
    end
    
    def insert_right(val)
      
    end
  end
end