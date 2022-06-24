class LinkedList
  attr_accessor :list

  def initialize(array = [])
    @list = array
  end

  def append(value)
    @list.push(Node.new(value))
    return unless @list.length > 1

    @list[-2].next_node = @list[-1]
  end

  def prepend(value)
    @list.unshift(Node.new(value))
    return unless @list.length > 1

    @list[0].next_node = @list[1]
  end

  def size
    @list.length
  end

  def head
    @list.first
  end

  def tail
    @list.last
  end

  def at(index)
    @list[index]
  end

  def pop
    @list.pop
    return unless @list.length.zero?

    @list[-1].next_node = nil
  end

  def contains?(value)
    @list.any? do |node|
      node.value == value
    end
  end

  def find(value)
    @list.each_with_index do |node, index|
      return index if node.value == value

      false
    end
  end

  def to_s
    value_array = @list.map { |node| "( #{node.value} )" }
    value_array.push('nil').join(' -> ')
  end
end

class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

linked_list = LinkedList.new

linked_list.append(1)

puts linked_list

linked_list.append(2)

puts linked_list

linked_list.prepend(0)

puts linked_list

linked_list.pop

puts linked_list
