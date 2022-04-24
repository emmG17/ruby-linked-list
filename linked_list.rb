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

  def traverse(iters = @size, &block)
    node = @head
    iters.times do
      block.call node if block_given?
      node = node.next_node
    end
  end
end
