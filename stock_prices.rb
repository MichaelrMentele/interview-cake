# array of stock prices where indexes represent a later timestamp

# [10, 7, 5, 8 , 11, 9]
# buy low sell high
# cannot be same element

# [10, 7, 5, 8, 11, 9]
# we need to keep track of the min to the left of every value
# 7: 10
# 5: 7

# order matters here, that usually means a stack,
# a queue or a linked list

# what I care about for each number is the max difference
# between it and the numbers before it

# at 10, can't sell
# at 7, could have bought 10, sell at 7 (-3)
# at 5, could have bought, 7 or 10 (-2)
# at 8, could have bought, 10, 7, 5... (3)
# 11, could have bought, 10, 7, 5, 8... (6)

# we can use a stack to store min values
# then store the max diff

# iterate through array, pushing each value to the stack
# if it is less than the value at the top of the stack
# compute the difference

# this will be O(n) space and time

# do we even need a stack? couldn't we just remember the min?

# totally

def get_max_profit(stock_prices_yesterday)
  if stock_prices_yesterday.length < 2
    raise IndexError, "Getting a profit requires at least 2 prices"
  end

  min_price = stock_prices_yesterday[0]
  max_profit = stock_prices_yesterday[1] - min_price

  for i in 1...stock_prices_yesterday.length do
    current_price = stock_prices_yesterday[i]

    profit = current_price - min_price
    max_profit = [max_profit, profit].max
    min_price = [min_price, current_price].min 
  end

  max_profit
end
