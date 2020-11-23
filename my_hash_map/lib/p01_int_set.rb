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
    if !include?(num)
      i = num % num_buckets 
      @store[i] << num
    end 
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
    # resize!
  end

  def insert(num)
   
    
    if !self.include?(num)
      i = num % num_buckets
      @store[i] << num
      @count += 1 
      resize! if @count > num_buckets
    end 
     
  end

  def remove(num)
    i = num % num_buckets
    if self.include?(num)
      @store[i].delete(num)
      @count -= 1
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


  def resize!
    new_buckets = num_buckets * 2
    before = @store
    @store = Array.new(new_buckets) {Array.new}
    before.flatten.each do |num|
      self.insert(num)
      @count -= 1
    end 
  end 
end
