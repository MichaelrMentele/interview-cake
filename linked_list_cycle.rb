class LinkedListNode
    
    attr_accessor :data, :next 
    
    def initialize(data)
        @data = data 
        @next = nil
    end
    
end

# We want to detect a cycle in a linked list. With one cursor traversing the list there is no way 
# to know that we have hit a cycle unless we store state on each node that it has been
# visited in which case we need to reset those nodes on a second pass. Instead we can use two
# cursors of different speeds and if they ever land on the same node then we know
# we have a cycle. If the slow cursor hits the end of the list then we are done and there is no 
# cycle

# a -> b -> c -> a
#      1         2
def contains_cycle(head)
    raise "invalid input" unless head 
    
    node = head
    slow = node 
    fast = node
    while fast && fast.next do 
        slow = slow.next
        fast = fast.next.next
        return true if slow == fast
    end 
    false
end
