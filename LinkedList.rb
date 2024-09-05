require_relative 'node'

class LinkedList
  attr_accessor :head, :tail
  def initialize
    self.head = nil
  end

  def append(value)
    if self.head.nil?
      self.head = Node.new(value)
    else
      temp = head
      while temp.next_node != nil do 
        temp = temp.next_node 
      end
      current = Node.new(value)
      temp.next_node = current
      current.next_node = nil
    end
  end

  def prepend(value)
    
    if self.head.nil?
      self.head = Node.new(value)
      self.head.next_node = nil
    else
      current = Node.new(value)
      current.next_node = head
      self.head = current
    end
  end

  def size
    counter = 0
    temp = head
    if head.nil?
      return 0
    elsif head.next_node.nil?
      return 1
    else
      while temp.next_node != nil do 
        counter += 1
        temp = temp.next_node
      end
      counter += 1
      return counter
    end
  end

  def head
     return @head
  end

  def tail
    @tail = head
    while @tail.next_node != nil 
      @tail = @tail.next_node
    end
    return @tail
  end

  def at(index)
    temp = head
    i = 0
    while i < index
      temp = temp.next_node
      i += 1
    end
    temp
  end

  def pop
    temp = head
    while temp.next_node.next_node != nil
      temp = temp.next_node
    end
    temp.next_node = nil
  end

end
