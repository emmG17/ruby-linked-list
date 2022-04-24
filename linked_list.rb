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
      add_first_node(data)
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
      add_first_node(data)
    else
      new_node = Node.new(data, @head)
      @head = new_node
    end
    @size += 1
    @head
  end

  def pop
    last_node = @tail
    if @size == 1
      @head = nil
      @tail = @head
    else
      @tail = traverse(@size - 2)
      @tail.next_node = nil
    end
    @size -= 1
    last_node
  end

  def at(index)
    traverse(index)
  end

  def add_first_node(data)
    @head = Node.new(data)
    @tail = @head
  end

  def traverse(iters = @size - 1)
    return nil unless iters >= 0 && iters < @size

    node = @head
    yield node if block_given?
    count = 0
    while count < iters
      node = node.next_node
      yield node if block_given?
      count += 1
    end
    node
  end
end
