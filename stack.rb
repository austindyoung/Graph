class Node
  def initialize(value, nextt = nil)
    @value = value
    @next = nextt
  end

  def value
      @value
  end

  def value=(new_value)
      @value = new_value
  end

  def nextt
    @next
  end

  def nextt=(new_next)
      @next = new_next
  end
end

class LinkedList
  def initialize
      @head = nil
  end

  def head
      @head
  end

  def add(value)
    new_head = Node.new(value, @head)
    @head = new_head
  end
end

class Stack < LinkedList
  def initialize(head = nil)
    @head = head
  end

  def head
    @head
  end

  def peak
    head.value
  end

  def push(v)
    add(v)
  end

  def pop
    if head == nil
      nil
    else
      res = head.value
      @head = @head.nextt
      res
    end
  end

  def value
    @head.value
  end

  #iterates through stack in order of popping, without actually popping
  def each
    buffer_stack = Stack.new
    loop do
      if head == nil
        break
      else
        buffer_stack.push(pop)
        yield(buffer_stack.peak)
      end
    end

    loop do
      if buffer_stack.head == nil
        break
      else
        push(buffer_stack.pop)
      end
    end
  end

  #iterates by successive popping
  def each_pop
    loop do
      if head == nil
        break
      else
        yield(pop)
      end
    end
  end

  def put
    each {|value| puts value}
  end
end
