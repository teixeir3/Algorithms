# you can write to stdout for debugging purposes, e.g.
# puts "this is a debug message"

def solution(a)
  uniqs = a.uniq.sort
  indexes = {}
  
  (a.length-1).downto(0) do |i|
    indexes[a[i]] = i
  end

  prefix = 0
  indexes.values.each do |val|
    prefix = val if prefix < val
  end
  
  prefix
end