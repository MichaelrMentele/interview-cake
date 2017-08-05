# sol 1: store nodes
# we can traverse the list, pushing each node onto the stack
# then when we hit the end popping k nodes. We don't actually need to store more than k nodes
# we can have a fixed window that we store of size k and when full, we have values at the bottom
# 'fall out' of the list 
# O(n) time and O(k) space

# sol 2: recursive calls with memoization
# we can make a recursive call with the base case of next == nil and return 1
# else, get the next node
# if the value is equal to k, return current node
# O(n) time and space

# sol 3: two scans, get length of list, then call node.next last_node - k times and return that node
# O(n) time and O(1) space

# sol 4: k sized window with two pointers
# O(n) time and O(1) space
