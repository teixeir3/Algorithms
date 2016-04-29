

# O(3n)
def solution(x, a)
  # Which elements in a(el) == x and which a(el) != x
  # split A so that (#elem == x in A) == (#elem != x in A)
  len= a.length
  leftMatch, rightMismatch = [], []
  match, mismatch = 0, 0
  
  0.upto(len-1) do |i|
    rightMismatch.unshift(mismatch)
    mismatch += 1 if a[i] != x
  end
  
  (len-1).downto(0) do |j|
    match += 1 if a[j] == x
    leftMatch << match
  end
  
  0.upto(len-1) do |i|
    return i if leftMatch[i] == rightMismatch[i]
  end
  
  false
end

# O(n^2)
# def solution(x, a)
#   # Which elements in a(el) == x and which a(el) != x
#   # split A so that (#elem == x in A) == (#elem != x in A)
#   len= a.length
#   leftMatch, rightMismatch = [], []
#   match = 0
#   mismatch = 0
#
#   0.upto(len-1) do |i|
#     rightMismatch.unshift(mismatch)
#     mismatch += 1 if a[i] != x
#   end
#
#   (len-1).downto(0) do |j|
#     match += 1 if a[j] == x
#     leftMatch << match
#   end
#
#   # puts "a: "
# #   p a
# #   puts "\n"
# #
# #   puts "left matches: "
# #   p leftMatch
# #   puts "\n"
# #
# #   puts "right mismatches: "
# #   p rightMismatch
# #   puts "\n"
#
#   0.upto(len-1) do |i|
#     return i if leftMatch[i] == rightMismatch[i]
#   end
#
#   # a.each_with_index do |el, i|
# #     numMatch += 1 if el == x
# #     numDiff = i - numMatch
# #     k = i if numMatch == numDiff
# #   end
#   # left = a.map { |el| el == x }
#   # right = a.map { |el| el != x }
#
#   # a.each_with_index do |el, i|
#  #    left << (el == x) ? true : false
#  #    right << (el != x) ? true : false
#  #  end
#   # p left
#   # p right
#   # p k
#   #
#   # k
# end

p solution(5, [5,5,1,7,2,3,5])

# # Should be O(n)
# def solution(x, a)
#   # Which elements in a(el) == x and which a(el) != x
#   # split A so that (#elem == x in A) == (#elem != x in A)
#   diffRight = 0
#   matchLeft = 0
#   k = 0
#
#   left = a.map { |el| el == x }
#   right = a.map { |el| el != x }
#
#   a.each_with_index do |el, i|
#
#   end
#
#   a.each_with_index do |el, i|
#     if (el == x)
#       matches[i] = true
#     end
#   end
#
#   right =
#   a.each_with_index do |el, i|
#     k = i if (match == diff)
#   end
# end