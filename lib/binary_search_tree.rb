class BST
  attr_reader :value, :key, :left, :right

  def initialize(key, value)
    @value = value
    @key = key
  end

  def insert(insert_key, insert_value)
    if insert_key > key
      insert_into(:right, insert_key, insert_value)
    elsif insert_key < key
      insert_into(:left, insert_key, insert_value)
    end
  end

  def search(search_key)
    found_node = nil
    if key == search_key
      found_node = self
    elsif search_key > key
      found_node = right.search(search_key) unless right.nil?
    else
      found_node = left.search(search_key) unless left.nil?
    end

    found_node
  end

  private

  def insert_into(name, child_key, child_value)
    if send(name).nil?
      send("#{name}=", BST.new(child_key, child_value))
    else
      send(name).insert(child_key, child_value)
    end
  end

  def right=(child)
    @right = child
  end

  def left=(child)
    @left = child
  end

end
