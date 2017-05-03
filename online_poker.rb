# Nailed, look at bonus questions

# [5, 1, 2, 3, 4, 6]
# [5,?,3]
# [2,4,6]
# maintaining order of both arrays inside of
# the combined array

# We can have 3 cursors, if the value in
# cursor_main isn't equal to one of the value at the others
# then we know it isn't a riffle, if it is equal increment the pointer
# in main and the half where it was equal.
def is_riffle?(shuffled_deck, half1, half2)
  half1_cursor = 0
  half2_cursor = 0
  for i in 0...shuffled_deck.length do
    if half1[half1_cursor] && shuffled_deck[i] == half1[half1_cursor]
      half1_cursor += 1
    elsif half2[half2_cursor] && shuffled_deck[i] == half2[half2_cursor]
      half2_cursor += 1
    else
      return false
    end
  end
  true
end

# Bonus
# 1. This assumes shuffled_deck contains all 52 cards. What if we can't trust this (e.g. some cards are being secretly removed by the shuffle)?
# 2. This assumes each number in shuffled_deck is unique. How can we adapt this to rifling arrays of random integers with potential repeats?
# 3. Our solution returns true if you just cut the deck—take one half and put it on top of the other. While that technically meets the definition of a riffle, what if you wanted to ensure that some mixing of the two halves occurred?
