class LinkedList
  class Node
    attr_accessor :data, :next_node

    def initialize(data = nil, next_node = nil)
      @next_node = next_node
      self.data = data
    end
    
  end
  private_constant :Node
  attr_reader :head, :tail, :size

  def initialize(data = nil)
    @head = data ? Node.new(data) : nil
    @tail = @head
    @size = @head ? 1 : 0
    @head.next_node = @tail unless @head.nil?
  end

  def append(data)
    if @head.nil?
      @head = Node.new(data)
      @tail = @head
    else
      new_node = Node.new(data)
      @tail.next_node = new_node
      @tail = new_node
    end
    @size += 1
    @tail
  end

  def prepend(data)
    if @head.nil?
      @head = Node.new(data)
      @tail = Node.new(@head.data)
      @head.next_node = @tail
    else
      new_node = Node.new(data, @head)
      @head = new_node
    end
    @size += 1
    @head
  end

  def at(index)
    if index.between?(0, @size - 1)
      return @tail if index == @size - 1

      traverse(index)
    end
    nil
  end

  def pop
    p traverse(@size - 1)
  end

  def traverse(index = @size)
    node = @head
    iters = index.zero? ? 0 : index - 1
    iters.times do
      node = node.next_node
    end
    node
  end
end
