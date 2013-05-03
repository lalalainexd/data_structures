class BST
  attr_reader :value, :left, :right

  def initialize(value)
    @value = value
  end

  def insert(insert_value)
    if insert_value > value
      insert_into(:right, insert_value)
    elsif insert_value < value
      insert_into(:left, insert_value)
    end
  end

  def search(search_value)
    found_node = nil
    if search_value == value
      found_node = self
    elsif search_value > value
      found_node = right.search(search_value) unless right.nil?
    else
      found_node = left.search(search_value) unless left.nil?
    end

    found_node
  end

  private

  def insert_into(name, child_value)
    if send(name).nil?
      send("#{name}=", BST.new(child_value))
    else
      send(name).insert(child_value)
    end
  end

  def right=(child)
    @right = child
  end

  def left=(child)
    @left = child
  end

end
