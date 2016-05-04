# Array
puts [1, 2, 3, 4].inspect
puts [1, 2, 3, 4].first
puts [1, 2, 3, 4].last
[1, 2, 3, 4].each do |element|
  puts element
end
[1, 2, 3, 4].each_with_index do |element, index|
  puts "#{index} -> #{element}"
end
puts [1, 2, 3, 4].map{|element|element*2}.to_a.inspect
puts [1, 2, 3, 4].find_all{|element|element.even?}.inspect
puts [1, 2, 3, 4].include? 2
array = [1, 2, 3, 4]
puts array.reverse.inspect
puts array.inspect
puts array.reverse!.inspect
puts array.inspect

# Hash
require 'json'
puts JSON.pretty_generate({"a" => 1, "b" => 2})
puts JSON.pretty_generate({:a => 1, :b => 2})
puts JSON.pretty_generate({a: 1, b: 2})
{"a" => 1, "b" => 2}.each do |key, value|
  puts "#{key} -> #{value}"
end

# Range
puts (1..4).inspect
puts (1..4).to_a.inspect
