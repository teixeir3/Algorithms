module Algorithms
  def fib_recursive(n)
    n < 2 ? n : fib_recursive(n-1) + fib_recursive(n-2)
  end
  
  puts 'Loaded Alrorithms::fib_recursive'
end