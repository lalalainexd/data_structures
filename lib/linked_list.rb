class LinkedList
  attr_reader :value, :next

  def initialize(value)
    @value = value
  end

  def add(insert_value)
    if @next.nil?
      @next = LinkedList.new(insert_value)
    else
      @next.add(insert_value)
    end
  end

  def find(node_value)
    node = nil
    if value == node_value
      node = self
    else
      node = @next.find(node_value) unless @next.nil?
    end
    node
  end

end
