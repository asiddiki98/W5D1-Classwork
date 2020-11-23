require "byebug"
class MaxIntSet
  def initialize(max)
    @max = max 
    @store = Array.new(max, false) 
  end

  def insert(num)
    if num > @max || num < 0
      raise "Out of bounds"
    else
      store[num] = true
    end
  end

  def store
    @store 
  end

  def remove(num)
    if store[num] == true 
      store[num] = false 
    end
  end

  def include?(num)
    store[num]
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    i = num % num_buckets 
    @store[i] << num
  end

  def remove(num)
    if include?(num)
      i = num % num_buckets
      @store[i].delete(num)
    end
  end

  def include?(num)
    i = num % num_buckets 
    @store[i].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
    #resize!
  end

  def insert(num) 
    
    @count += 1
    resize!
    i = num % num_buckets
    @store[i] << num
  end

  def remove(num)
  end

  def include?(num)
    i = num % num_buckets
    @store[i].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
  
  def count 
    @count 
  end

  def num_buckets=(value)
    @store.length = value 
  end
  #debugger
  def resize!
    #debugger
    num_buckets += 1 if @count > num_buckets
  end
end
