class HashSet
  attr_accessor :count, :store

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    return false if self.include?(key)
      self[key] << key
      @count += 1
    resize! if num_buckets < count
    
  end

  def include?(key)
    self[key].include?(key)
  end

  def remove(key)
    if self.include?(key)
      self[key].delete(key)
      @count -=1
    end 
  end

  private

  def [](num)
    @store[num.hash % num_buckets]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    store.length
  end

  def resize!
    cache = self.store
    @count = 0 #self.count
    self.store = Array.new(num_buckets*2) { Array.new }
    cache.flatten.each {|e| self.insert(e)}
    
  end
end
