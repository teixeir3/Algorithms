# you can write to stdout for debugging purposes, e.g.
# puts "this is a debug message"
# A = [-1, 3, -4, 5, 1, -6, 2, 1]
#  solution(A) = 1, 3, or 7

# First try
# def solution(a)
#   # write your code in Ruby 2.2
#   equilibrium_i = -1
#
#   a.length.times do |i|
#     left = a[0...i]
#     right = a[i+1..a.length-1]
#     equilibrium_i = i if left.inject(&:+) == right.inject(:+)
#   end
#
#   equilibrium_i
# end

# Refactor:

# def equilibrium_index(a)
#   a.length.times do |i|
#     left = a[0...i]
#     right =  a[i+1..a.length-1]
#     left_sum = left.inject(&:+)
#     right_sum = right.inject(&:+)
#     right = 0 if i == a.length-1
#     left = 0 if i == 0
#     puts left
#     puts right
#     return i if left_sum == right_sum
#   end
#
#   -1
# end

# Runs in O(n^2). Should be constant! inject iterates though the array to calculate the sum, we should instead do this in constant time.
# def equilibrium_index(a)
#   return -1 if a.empty?
#   sum = 0
#
#   a.length.times do |i|
#     sum += a[i]
#     left = a[0...i]
#     right =  a[i+1..a.length-1]
#     lsum = i == 0 ? 0 : left.inject(&:+)
#     rsum = i == (a.length - 1) ? 0 : right.inject(&:+)
#
#     return i if lsum == rsum
#   end
#
#   -1
# end

#  Refactor x2: Constant time => O(2n) reduces to => O(n)
def equilibrium_index(a)
  return -1 if a.empty?
  sum = a.inject(:+)
  lsum = 0
  
  a.length.times do |i|
    rsum = sum - lsum - a[i]
    return i if lsum == rsum
    lsum += a[i]
  end
  
  -1
end

# puts "equilibrium_index([]) = " + equilibrium_index([]) + "\n Expected: 0"
equilibrium_index([0,5])
equilibrium_index([5,0])