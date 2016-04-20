[[1, 0, 2],
[3, 1, 1],
[3, 5, 6]]

#[1,5,9,3,6]
#[15,1,2,3,4,5]
#[5,4,3,4,2,3,4]
#find the weighted midpoint

def find_midpoint(arr)
  total = arr.inject { |sum, el| sum + el }
  mid = (total / 2)
  value = 0
  
  arr.each_with_index do |x, i|
    value = value + x
    
    if value >= mid
      mid_i = i
      break
    end
  end

  left_sum = 0
  
  0.upto(mid_i).each do |y|
    
  end
  
  mid_i.upto(arr.count).each do |y|
    
  end
  
  
  
  # arr.length - 1
end


# def say_hello
#   puts 'Hello, World'
# end

# 5.times { say_hello }
