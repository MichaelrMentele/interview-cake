class Node
  attr_accessor :value, :next
  
  def initialize(val)
    @value = val
    @next = nil
  end
end

# inplace
def reverse(head)
    raise "Invalid input node" unless head
    return head unless head.next
    
    prev = nil
    cur = head
 
    while cur
        nxt = cur.next
    	cur.next = prev # assign current node to previous
   		
        # move to next node
        prev = cur
        cur = nxt
    end
    cur
end

# out of place (preserve input list)
def reverse_copy(head)
  node_stack = []
  
  node = head
  while node 
    node_stack.push(Node.new(node.value))
    node = node.next
  end
  
  new_list = node_stack.pop
  while node_stack[-1]
    new_list.next = node_stack.pop
    new_list = new_list.next
  end
  new_list
end
