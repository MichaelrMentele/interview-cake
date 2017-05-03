# The shuffle must be "uniform," meaning each item in the
# original array must have the same probability of ending
# up in each spot in the final array.
#
# Assume that you have a function get_random(floor, ceiling)
# for getting a random integer that is >= floor and <= ceiling.

# The problem I see is that if we move an element, to another
# index, do we block that index? Or is it fair game. We can't
# block it if we want each value to have the same probablility
# unless we traverse the array in random order. So, we will allow
# values to swap even if they have already been swapped.

def naieve_shuffle(array)
  for i in 0...array.length do
    swap_index = get_random(0, array.length-1)
    temp = array[i]
    array[i] = array[swap_index]
    array[swap_index] = temp
  end

  array
end

# Fisher-Yates shuffle
def shuffle(array)
  for i in 0...array.length do
    swap_index = get_random(i, array.length-1)
    temp = array[i]
    array[i] = array[swap_index]
    array[swap_index] = temp
  end

  array
end

[a, b] => [b, a]
# [a, b]
# [b, c] => [a, b, c]  1/n*1/(n-1)*1/(n-2) = 1/3 * 1/2 * 1 = 1/6
# [a, b, c] [a, c, b] [c, a, b] [c, b, a] [b, a, c] [b, c, a]

# [a, b, c] 1/3*1/3*1/3 = 1/9
