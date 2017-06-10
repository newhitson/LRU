class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    map.with_index {|el, i| el.hash % i.hash}.reduce(:+).hash
  end
end

class String
  def hash
    chars.map {|ch| ch.ord}.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    to_a.sort_by {|k, v| v}.map {|pair| pair.hash}.hash
  end
end
