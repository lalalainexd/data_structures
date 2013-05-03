require 'colorize'
require 'set'

require_relative './lib/binary_search_tree'
require_relative './lib/linked_list'

def generate_random_values(size)
  set = Set.new
  size.times do
    set << rand(10000000)
  end
  set
end

def build_bst set
  bst = nil
  set.each do |value|
    if bst.nil?
      bst = BST.new(value)
    else
      bst.insert(value)
    end
  end
  bst
end

def build_linked_list set
  list = nil
  set.each do |value|
    if list.nil?
      list = LinkedList.new(value)
    else
      list.add(value)
    end
  end
  list
end

def time_computation description, color=:black, &computation
  printf("%50s",description.colorize(color))
  t1 = Time.now
  result = computation.yield
  t2 = Time.now
  delta = t2 - t1
  printf(" %3.6f sec\n", delta)
  result
end

def compare_times description, values
  puts "###########################################################"
  puts description.upcase
  puts "###########################################################"

  value = values.to_a.sample

  list = time_computation("Building LinkedList", :blue){ build_linked_list(values)}
  time_computation("Searching in LinkedList for #{value}", :blue){list.find(value)}


  bst = time_computation("Buillidng BST", :green){ build_bst(values) }
  time_computation("Searching in BST for #{value}", :green){bst.search(value)}
end

def compare_with_size max
  values = generate_random_values(max)
  compare_times("comparing with random insert with #{values.size} values", values)

  values = (0...values.size).to_a
  compare_times("comparing with sorted insert with #{values.size} values", values)
end

compare_with_size(10)
puts "\n\n"
compare_with_size(100)
puts "\n\n"
compare_with_size(1000)