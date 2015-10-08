class MyStack

  def initialize
    @store = []
  end

  def pop
    pop = @store.last
    @store = @store[0..-2]
    pop[:value]
  end

  def push(el)

    if @store.last.nil? || @store.last[:max] < el
      curr_max = el
    else
      curr_max = @store.last[:max]
    end


    if @store.last.nil? || @store.last[:min] > el
      curr_min = el
    else
      curr_min = @store.last[:min]
    end

    final_el = {:value => el, :max => curr_max, :min => curr_min}
    @store[@store.length] = final_el
  end

  def peek
    @store.last
  end


  def size
    @store.size
  end

  def empty?
    @store.size == 0
  end

  def max
    @store.last[:max] unless @store.empty?
  end

  def min
    @store.last[:min] unless @store.empty?
  end
end

class StackQueue
  def initialize
    @queue_in = MyStack.new
    @queue_out = MyStack.new
  end

  def enqueue(el)
    @queue_in.push(el)
  end

  def dequeue

    if @queue_out.empty?
      @queue_in.size.times { @queue_out.push(@queue_in.pop) }
    end
    @queue_out.pop
  end

  def size
    @queue_in.size + @queue_out.size
  end

  def empty?
    @queue_in.empty? && @queue_out.empty?
  end

  def max
    [@queue_in.max, @queue_out.max].compact.max
  end

  def min
    [@queue_in.min, @queue_out.min].compact.min
  end


end

a = StackQueue.new
a.enqueue(1)
a.enqueue(10)
a.enqueue(100)
a.enqueue(50)
a.min
a.max
a.dequeue
a.min
a.max
