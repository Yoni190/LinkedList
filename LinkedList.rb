require_relative 'node'

class LinkedList
  attr_accessor :head
  def initialize
    self.head = nil
  end

  def append(value)
    if self.head.nil?
      head = Node.new(value)
    else
      current = head
      while current.next_node != nil do current = current.next_node end
      current = Node.new(value)
    end
  end

end
