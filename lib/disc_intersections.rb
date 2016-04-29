# you can write to stdout for debugging purposes, e.g.
# puts "this is a debug message"



# Runs in O(n^2)
# def solution(a)
#   tupples = []
#   len = a.length
#   count = 0
#
#   a.each_with_index do |el, i|
#     tupples << [i-el,i+el]
#   end
#
#   tupples.sort
#
#   tupples.each_with_index do |tupple, i|
#     (i+1).upto(len-1).each do |k|
#       comparison = tupples[k]
#       if (comparison[0] <= tupple[1])
#         count = count + 1
#         return -1 if (count > 10000000)
#       else
#         next
#       end
#     end
#   end
#   return count
# end

# TODO: write O(n*log(n)) solution. Instead of using an array of 2 element arrays,
# Use 1 array to store i+el, and one to store 1-el

def solution(a)
  a1 = []
  a2 = []
  len = a.length
  count = 0
  
  a.each_with_index do |el, i|
    a1 << i-el
    a2 << i+el
  end
  
  a1.sort
  a2.sort
  
  (len-1).downto(0) do |i|
    position = a2.find_index(a1[i])
    if position && position >= 0
      while ((position < len) && (a2[position] == a1[i])) do
        position += 1
      end
      count += position     
    else
      insertion_point = -(position+1)
      count += insertion_point
    end
  end
  
  sub = len*((len+1)/2)
  
  return -1 if (count > 10000000)
  
  count
end

# position = 0
# loop do
#   position += 1
#   puts position
#   if (position > 3)
#     break
#   end
# end
