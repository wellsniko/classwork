class MaxIntSet
  def initialize(max)
    @max = max
    @store = Array.new(max, false)
    #store = [t,f,t,t]
    #sotre = [0,1,2,3]
  end

  attr_accessor :store

  def insert(num)
    raise "Out of bounds" if num >= @max || num < 0
    @store[num] = true
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num] == true
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
    return if include?(num)
    self[num] << num
  end

  def remove(num)
     self[num].delete(num) 
  end

  def include?(num)
    self[num].include?(num)
  end
  #store = [[20,40,0,60,],[21,1,41,61],[]]... % 20

  private

  def [](num)
    @store[num % num_buckets]
    # optional but useful; return the bucket corresponding to `num`
  end

  # def []=(num,value)
  #   @store[num % num_buckets] <<
  # end

  def num_buckets
    @store.length
  end
end



class ResizingIntSet
  attr_accessor :count, :store


  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
    
  end

  def insert(num)
     if !self.include?(num)
      self[num] << num
      @count +=1
     end 
     resize! if num_buckets < count
  end

  def remove(num)
    if self.include?(num)
      self[num].delete(num)
      @count -=1
    end 
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    self.store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    # return false if @num_buckets <= @count
    cache = self.store
    self.count = 0
    self.store = Array.new(num_buckets * 2) { Array.new }
    cache.flatten.each{|e| insert(e)}
      

  end
end

#cache = [all the stuff]
#re-intiliaze 
#cache.each {|e| self.insert(e)}