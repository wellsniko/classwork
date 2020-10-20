class Integer
  # def hash
  # Integer#hash already implemented for you
end

class Array
  def hash
    count = 0
    self.each_with_index{|e,i| count = e.hash ; count += i}
    count 
  end
end

class String
  def hash
     #[23,134,43,234,42]
    self.chars.map {|e| e.ord}.hash
    # self.each_char.with_index {|e, i| i = e.ord.hash }#; count += 1}
   
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    self.to_a.sort.hash
  end
end



