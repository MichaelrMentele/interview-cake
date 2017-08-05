# Implement a queue (FIFO) with 2 stacks. Have a enqueue and dequeue functioin that optimizes for the time cost of m function calls on the queue. Any mix of enqueue and dequeue calls. 

# Approach, in order to have a queue, we push new things into the stack on enqueue
# on dequeue we need to reverse it to find the first thing in the stack. 
# if we have enqueued a value we need to reverse it to push to the back of the queue
# whenever we have a enqueue and dequeue operation one after another we have a O(n) cost
# because we need to put the value into the queue. We could do this lazily, so that back
# to back enqueue/dequeue calls have an O(1) cost

# if enqueue, put everything in stackA (if not already) and push to StackA
# else, put everything in stack B and pop (if not already in stack b

# Worst case is if it alternates everytime. 
# wait, do we even need ot put everything back? Whenever we enqueue it is the oldest value
# we can always push to in_stack (A), on dequeue we just transfer everything from A to B
class Queue 
  
  def initialize
    @stackA = []
    @stackB = []
  end

  def enqueue(item)
    @stackA.push(item)
  end 

  def dequeue
    if @stackB.empty?
      swap_stack(dest: @stackB, src: @stackA)
    end 

    @stackB.pop
  end
  
  private 

  def swap_stack(dest:, src:)
    while !src.empty?
      dest.push src.pop
    end 
  end
 
end
