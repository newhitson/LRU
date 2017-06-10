require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
  attr_reader :count
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)

    if @map.include?(key)
      old_link = @map.get(key)
      update_link!(old_link)
      @map.set(key,old_link)
    else
      @store.remove(@store.first.key) if count > @max

      new_link = @store.append(key,@prc.call(key))
      @map.set(key,new_link)
    end
  end

  def to_s
    "Map: " + @map.to_s + "\n" + "Store: " + @store.to_s
  end

  private

  def calc!(key)
    # suggested helper method; insert an (un-cached) key
    value =  @store.get(key)
    @map.set(key, value)
  end

  def update_link!(link)
    # suggested helper method; move a link to the end of the list
    @store.remove(link.key)
    @store.append(link.key, link.val)

  end

  def eject!
  end
end
