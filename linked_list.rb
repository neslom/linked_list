#require 'pry'
class IterativeLinkedList
	attr_accessor :head, :tail
	def initialize
		@head = nil
		@tail = nil
		@list_count = 0
	end

	def count
		if @head.nil?
			0
		else
			@list_count
		end
	end

	def push(data)
		current = @head
		@list_count += 1
		node = Node.new(data)
		if @head.nil?
			# if there is only one item in list, then it is both
			# the head and tail, so they are set equal to each other
		  @head = node
		  @tail = @head
		else
			# if head has a value and node.next is nil, 
			# while current.next != nil
			# 	current.next.
			@tail.next = node
			@tail = node
		end
	end

	def pop
		current = @head
		return nil if current.nil?
		@list_count -= 1
		popped_tail = @tail.data
		if @head.next == nil
			# if only one item in list, set it equal to nil
			# after pop has been called
			@head = nil
			@tail = @head
			popped_tail
		else 
			head = @head
			head = head.next until head.next.next == nil
			@tail = head

			@tail.next = nil
			popped_tail
		end
	end

	def delete(data)
		current = @head
		#last = @tail
		return nil if current.nil?
		if current.data == data
			@head = @head.next
			@list_count -= 1
		else
		  while current.next != nil
		  	if current.next.data == data
		  		current.next = current.next.next
		  		@list_count -= 1
		  	else
		  		# this key line is necessary to prevent neverending loop
		  		# if you don't set current = current.next
		  		# the loop never moves off of the initial node
		  		current = current.next
		  	end
		  end
		end
	end
end

class Node
  attr_accessor :data, :next
  def initialize(data)
  	@data = data
  	@next = nil
  end
end
list = IterativeLinkedList.new
list.push("hello")
list.push("world")
list.push("today")
# list.push("christmas")
# list.push("heythere")
# p list.pop
# p list.tail
p list 
list.delete("world")
p list 
