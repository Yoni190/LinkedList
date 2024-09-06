require_relative "node"

class LinkedList
  attr_accessor :head

  def initialize
    self.head = nil
  end

  def append(value)
    if head.nil?
      self.head = Node.new(value)
    else
      temp = head
      temp = temp.next_node until temp.next_node.nil?
      current = Node.new(value)
      temp.next_node = current
      current.next_node = nil
    end
  end

  def prepend(value)
    if head.nil?
      self.head = Node.new(value)
      head.next_node = nil
    else
      current = Node.new(value)
      current.next_node = head
      self.head = current
    end
  end

  def size
    counter = 0
    temp = head
    head.nil? ? 0 : count_nodes(temp, counter)
  end

  def count_nodes(temp, counter)
    until temp.next_node.nil?
      counter += 1
      temp = temp.next_node
    end
    counter += 1
    counter
  end

  def tail
    tail = head
    tail = tail.next_node until tail.next_node.nil?
    tail
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
    temp = temp.next_node until temp.next_node.next_node.nil?
    temp.next_node = nil
  end

  def contains?(value)
    temp = head
    until temp.nil?
      return true if temp.value == value

      temp = temp.next_node
    end
    false
  end

  def find(value)
    temp = head
    counter = 0
    until temp.nil?
      return counter if temp.value == value

      temp = temp.next_node
      counter += 1
    end
    nil
  end

  def to_s
    list = ""
    temp = head
    until temp.nil?
      list += "(#{temp.value}) -> "
      temp = temp.next_node
    end
    list += "nil"
    list
  end

  def insert(value, index)
    temp = head
    new_node = Node.new(value)
    counter = 1
    if index > size
      puts "Out of bound"
    elsif index.zero?
      prepend(value)
    else
      while counter != index
        temp = temp.next_node
        counter += 1
      end
      new_node.next_node = temp.next_node
      temp.next_node = new_node
    end
  end

  def remove_at(index)
    temp = head
    counter = 1
    if index.zero?
      self.head = head.next_node
    else
      while counter != index
        temp = temp.next_node
        counter += 1
      end
      temp.next_node = temp.next_node.next_node
    end
  end
end
