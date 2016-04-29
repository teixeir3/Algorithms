# use the biggest currency first, then go to the next.
# works well w/ american coins, but it's not always best to use 
# the biggest coin first: ex make_change(14, [10, 7, 1])

# 3 * 25 leaves me w/ 24
#  2 * 10 leaves 4
# 0 * 5 leaves 4
# 4 * 1 leaves 0

# Relies on coins being in descending order
def make_change_iterative(amount, coins = [25, 10, 5, 1])
  change = []
  coins.each do |coin|
    count = amount / coin # how many of that coin I can use
    count.times { change << coin }
    amount -= count * coin
  end
  
  change
end

# def make_change_rec(amount, coins = [25, 10, 5, 1])
#   change = []
#
#   first_coin = coins[0]
#
#   count = amount / first_coin
#   count.times { change << first_coin }
#   amount -= first_coin * count
#
#   if amount > 0
#     change += make_change_rec(amount, coins.drop(1))
#   end
#
#   change
# end

# This solution is slower, but more flexible. It has to try out every
# potential solution to compare which is best, but it finds the 
# solution that uses the fewest coins in any currency system
def make_change_rec(amount, coins = [25, 10, 5, 1])
  return [] if amount == 0
  
  return nil if coins.none? { |coin| coin <= amount }
  
  coins = coins.sort.reverse
  
  best_change = nil
  coins.each_with_index do |coin, i|
    next if coin > amount
    
    change_for_rest = make_change_rec(amount - coin, coins.drop(i))
    next if change_for_rest.nil?
    change = [coin] + change_for_rest

    # Best = fewest coins used to make accurate change
    if best_change.nil? || change.count < best_change.count
      best_change = change
    end
  end
  
  best_change
end

def make_change(target, coins = [25, 10, 5, 1])
  # Don't need any coins to make 0 cents change
  return [] if target == 0
  # Can't make change if all the coins are too big. This is in case
  # the coins are so weird that there isn't a 1 cent piece.
  return nil if coins.none? { |coin| coin <= target }

  # Optimization: make sure coins are always sorted descending in
  # size. We'll see why later.
  coins = coins.sort.reverse

  best_change = nil
  coins.each_with_index do |coin, index|
    # can't use this coin, it's too big
    next if coin > target

    # use this coin
    remainder = target - coin

    # Find the best way to make change with the remainder (recursive
    # call). Why `coins.drop(index)`? This is an optimization. Because
    # we want to avoid double counting; imagine two ways to make
    # change for 6 cents:
    #   (1) first use a nickel, then a penny
    #   (2) first use a penny, then a nickel
    # To avoid double counting, we should require that we use *larger
    # coins first*. This is what `coins.drop(index)` enforces; if we
    # use a smaller coin, we can never go back to using larger coins
    # later.
    best_remainder = make_change(remainder, coins.drop(index))

    # We may not be able to make the remaining amount of change (e.g.,
    # if coins doesn't have a 1cent piece), in which case we shouldn't
    # use this coin.
    next if best_remainder.nil?

    # Otherwise, the best way to make the change **using this coin**,
    # is the best way to make the remainder, plus this one coin.
    this_change = [coin] + best_remainder

    # Is this better than anything we've seen so far?
    if (best_change.nil? || (this_change.count < best_change.count))
      best_change = this_change
    end
  end

  best_change
end

# p make_change_iterative(99, [25, 10, 5, 1])
# p make_change_rec(99, [25, 10, 5, 1])
p make_change_rec(14, [10, 7, 1])