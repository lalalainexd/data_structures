class LinkedList
  attr_reader :key, :value, :next

  def initialize(key, value)
    @key = key
    @value = value
  end

  def add(insert_key, insert_value)
    if @next.nil?
      @next = LinkedList.new(insert_key, insert_value)
    else
      @next.add(insert_key, insert_value)
    end
  end

  def find(find_key)
    node = nil
    if key == find_key
      node = self
    else
      node = @next.find(find_key) unless @next.nil?
    end
    node
  end

end
