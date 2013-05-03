require 'colorize'
require 'set'

require_relative './lib/binary_search_tree'
require_relative './lib/linked_list'

def generate_random_key_values(size)
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
      bst = BST.new(value, value)
    else
      bst.insert(value, value)
    end
  end
  bst
end

def build_linked_list set
  list = nil
  set.each do |value|
    if list.nil?
      list = LinkedList.new(value, value)
    else
      list.add(value, value)
    end
  end
  list
end

def time_computation description, color=:black, &computation
  printf("%50s",description.colorize(color))
  t1 = Time.now
  result = computation.yield
  t2 = Time.now
  print " time: #{t2 - t1} sec\n"
  STDOUT.flush
  result
end

def compare_times description, values
  puts "##############################################"
  puts description.upcase
  puts "##############################################"

  value = values.to_a.sample

  list = time_computation("Building LinkedList", :blue){ build_linked_list(values)}
  time_computation("Searching in LinkedList for #{value}", :blue){list.find(value)}


  bst = time_computation("Buillidng BST", :green){ build_bst(values) }
  time_computation("Searching in BST for #{value}", :green){bst.search(value)}
end

max = 2500

values = generate_random_key_values(max)
compare_times("comparing with random insert with #{values.size} values", values)

values = (0...values.size).to_a
compare_times("comparing with sorted insert with #{values.size} values", values)