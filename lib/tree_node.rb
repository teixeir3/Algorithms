# Tree
#   Good for representing heirarchical data
#   Composed of Nodes
#   Each Node has a value
#   Each Node can have zero or one parent
#   Each Node can have zero or many children
#   Trees are a recursive data structure
#   Each child can be the root of a subtree
#   Can write operations recursively
#   Trees are good for:
#   Organizing hierarchical data (e.g. file system)
#   Organizing data when fast search, insertion, and deletion are needed ---
#   Tree Vocab
#
# Node/Vertex
#   Link/Edge: Connections between nodes
#   Are (N - 1) edges
#   Child, Parent, Grand
#   Root
#   Leaf
#   Depth: Depth of node is number of edges from it to root
#   Height: Height of node is number of edges in longest path from the node to a leaf
#   Specialized Trees
#
# Binary Tree
#   0 to 2 children per node
#   good for search and balanced trees

# Binary Search Tree
#   "Left subtree" holds children with value less than parent's
#   "Right subtree" holds children with value greater than parent's
# 
# Poly Tree
#   0 or many children per node

module Algorithms
  class PolyTreeNode
    attr_accessor :value, :children, :parent

    def initialize(value = nil)
      @value = value
      @children = []
    end

    def add_child(node)
      @children << node
      node.parent = self
    end

    def remove_child(node)
      @children.delete(node)
      node.parent = nil
    end

    def to_s
      "<TreeNode @value=#{self.value}>"
    end
    
    def parent=(node)
      # node.add_child(self)
      @parent = node
      node.children << self
    end

    # DFS
  #
  #   Stack (LIFO)
  #     Recursive call stack
  #     Linear in depth (memory)
  #     Just hold one path through the tree in memory
  #     Lends its self to recursive definition (check everything in left, check everything in the right)
  #     must see whole tree anyway
  #     you know d, the level of the answer
  #     don't care if the answer is closest to root
  #     possibly explores deep dead ends
  # 
  #   DFS Process
  #     Is current node's value the target?
  #     Loop through nodes children
  #     For each child, recursively call DFS

    def dfs_iterative(target)
      stack = [self]

      until stack.empty?
        node = stack.pop

        return node if node.value == target

        node.children.each do |child|
          stack << child
        end
      end

      nil
    end

    def dfs_recursive(target)
      return self if self.value == target

      children.each do |child|
        result = child.dfs_recursive(target)
        return result if result
      end

      nil
    end
  
    # BFS
    #
    # Queue (FIFO)
    #   Exponential in depth (memory)
    #   Has to hold whole tree in memory
    #   Finds shallowest solution
    #   Memory requires that we fully store the previous level and add all children
    #   Better when answer is close to the root
    #   you want the answer that is closest to the root
    #   have multiple cores/processors (thanks to Suresh)
    #
    # BFS Process
    # Add node to a queue
    # Loop through queue until its empty
    # Shift off current node
    # Check if current node's value is the target
    # Add current node's children to queue
  

    def bfs_iterative(target)
      queue = [self]

      until queue.empty?
        node = queue.shift

        return node if node.value == target

        node.children.each do |child|
          queue << child
        end
      end

      nil
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

    def count_iterative
      count = 1
      queue = [self]

      until queue.empty?
        node = queue.shift

        queue += node.children
        count += node.children.count
      end

      count
    end

    def count_recursive
      1 + children.map(&:count_recursive).inject(0, :+)
    end

    def path_iterative
      path = []
      node = self

      while node
        path << node
        node = node.parent
      end

      path.reverse
    end

    def path_recursive
      self.parent ? self.parent.path_recursive + [self] : [self]
    end
  end  
end


# tree_node = Algorithms::TreeNode.new(1)
# tree_node.add_child(Algorithms::TreeNode.new(2))
# tree_node.add_child(Algorithms::TreeNode.new(3))
# tree_node.children.first.add_child(Algorithms::TreeNode.new(4))
# tree_node.children.last.add_child(Algorithms::TreeNode.new(5))
# tree_node.children.last.children.last.add_child(Algorithms::TreeNode.new(6))
# tree_node.children.last.children.last.add_child(Algorithms::TreeNode.new(7))
#
# puts
#
# p tree_node.dfs_recursive(7)
# p tree_node.bfs_recursive(7)
# p tree_node.dfs_iterative(7)
# p tree_node.bfs_iterative(7)
#
# puts
#
# p tree_node.dfs_recursive(5)
# p tree_node.bfs_recursive(5)
# p tree_node.dfs_iterative(5)
# p tree_node.bfs_iterative(5)
#
# puts
#
# p tree_node.dfs_recursive(3)
# p tree_node.bfs_recursive(3)
# p tree_node.dfs_iterative(3)
# p tree_node.bfs_iterative(3)
#
# puts
#
# p tree_node.dfs_recursive(9)
# p tree_node.bfs_recursive(9)
# p tree_node.dfs_iterative(9)
# p tree_node.bfs_iterative(9)
#
# puts
#
# p tree_node.count_iterative
# p tree_node.count_recursive
#
# puts
#
# p tree_node.dfs_recursive(7).path_iterative
# p tree_node.dfs_recursive(7).path_recursive
