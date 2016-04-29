# Write a function that will traverse an unbalanced, unsorted binary tree, looking for a node with a specific value. Your function should return a pointer to that node.

# class BinaryTreeNode
#   @val =
#   def find(val)
#     # search
#   end
# end

module Algorithms
  class TreeNode
    attr_accessor :value, :left, :right, :children, :parent
  
    def initialize(val = nil)
      @value = val
      @children = []
    end
  
    def bst_insert(val)
      case value <=> val
      when 1 then insert_left(val)
      when -1 then insert_right(val)
      end
    end
  
    def bt_insert(val)
      child = TreeNode.new(val)
      if @left.nil?
      elsif @right.nil?
      else
        #do something
      end
    
      child
    end
  
    def add_child(node)
      @children << node
      node.parent = self
    end
    
    def remove_child(node)
      @children.delete(node)
      node.parent = nil
    end
    
    def parent=(node)
      # node.add_child(self)
      if node #|| @parent != node #!node.children.include?(self)
        
        node.children << self unless node.children.include?(self)
      end
      # @parent.children.delete(node) if @parent
      @parent = node
      
      
    end
  
    def insert_left(val)
      @left = TreeNode.new(val)
    end
  
    def insert_right(val)
      @right = TreeNode.new(val)
    end
  
    def poly_dfs(target)
    
    end
  
    def grandchildren(child)
      child.children
    end
  
    def dfs_iterative(target)
      stack = [self]
    
      until stack.empty?
        node = stack.pop
        
        return node if node.value == target
        stack += node.children
      end
      
      false
    end
    
    def dfs_recursive(target)
      return self if target == self.value
      
      children.each do |child|
        result = child.dfs_recursive(target)
        return result if result
      end
      
      nil
    end
    
    def bfs_iterative(target)
      queue = [self]
      
      until queue.empty?
        node = queue.shift
        
        return node if node.value == target
        queue += node.children
      end
      
    end
    
    def bfs_recursive(target, fringe = [self])
      return nil if fringe.empty?
      
      next_fringe = []
      fringe.each do |node|
        return node if node.value == target
        next_fringe += node.children
      end
      
      bfs_recursive(target, next_fringe)
    end
  end
end

# load 'lib/binary_tree.rb'
#     1
#   2   3
# 4     5
#       6 7


tree_node = Algorithms::TreeNode.new(1)
tree_node.add_child(Algorithms::TreeNode.new(2))
tree_node.add_child(Algorithms::TreeNode.new(3))
tree_node.children.first.add_child(Algorithms::TreeNode.new(4))
tree_node.children.last.add_child(Algorithms::TreeNode.new(5))
tree_node.children.last.children.last.add_child(Algorithms::TreeNode.new(6))
tree_node.children.last.children.last.add_child(Algorithms::TreeNode.new(7))

tree_node.dfs_iterative(7)
tree_node.bfs_iterative(7)
tree_node.dfs_recursive(7)
tree_node.bfs_recursive(7)



root = Algorithms::TreeNode.new(4)
root.bt_insert(3)

#
# def dfs_iterative(target)
#   stack = [self]
#
#   until stack.empty?
#     current_node = stack.pop
#     return current_node if current_node.value == target
#     stack += current_node.children
#   end
#
#   nil
# end
#
# def dfs_iterative(target)
#   stack = [self]
#
#   until stack.empty?
#     node = stack.pop
#
#     return node if node.value == target
#     stack += node.children
#   end
#
#   false
# end
#
# def dfs_recursive
#
# end
#
#
# def bfs_iterative(target)
#   queue = [self]
#
#   until queue.empty?
#     node = queue.shift
#
#     return node if node.value == target
#     queue += node.children
#   end
#
#   nil
# end
#
# def bfs_iterative(target)
#   queue = [self]
#
#   until queue.empty?
#     current_node = queue.shift
#     return current_node if current_node.value == target
#     queue += current_node.children
#   end
#
#   nil
# end
#
# def bfs_recursive(target)
#   return self if self.value == target
#   fring = []
#
#
# end