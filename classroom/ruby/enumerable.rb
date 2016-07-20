# Enumerable - http://ruby-doc.org/core-2.3.1/Enumerable.html
# ObjectSpace.count_objects
ObjectSpace.each_object(::Class).select {|klass|
  # Enumerator, Dir, File, ARGF.class, IO, Range, Struct, Hash, Array
  klass.included_modules.include? Enumerable
}

# Array - http://ruby-doc.org/core-2.3.1/Array.html
puts [].inspect
puts Array.new.inspect
puts Array.new(4, 0).inspect
puts [1, 2, 3, 4].inspect
puts [1, 'hello', false].inspect
puts [1, 2, 3, 4].size

puts ([ 1, 1, 3, 5 ] + [ 1, 2, 3 ]).inspect
puts ([ 1, 1, 3, 5 ] << 1).inspect
puts ([ 1, 1, 3, 5 ] - [ 1, 2, 3 ]).inspect
puts ([ 1, 1, 3, 5 ] & [ 1, 2, 3 ]).inspect
puts ([ 1, 1, 3, 5 ] * 2).inspect

array = []
array[0] = 1
array[1] = 2
array[9] = 10
puts array.inspect
puts array.compact.inspect

puts [1, 2, 3, 4][0]
puts [1, 2, 3, 4].first
puts [1, 2, 3, 4].first(2).inspect

puts [1, 2, 3, 4][-1]
puts [1, 2, 3, 4].last

puts [1, 2, 3, 4][2..3]
puts [1, 2, 3, 4][0..-1]
puts [1, 2, 3, 4][2,1]

puts %w[first second third fourth fifth sixth].join(', ')
puts %w[first second third fourth fifth sixth] * ', '
puts "first, second, third, fourth, fifth, sixth".split(', ').inspect

puts [1, 1, 2, 3, 4].count(1)
puts [1, 2, 3, 4].permutation.inspect
puts [1, 2, 3, 4].rotate.inspect
puts [1, 2, 3, 4].sample.inspect
puts [1, 2, 3, 4].shuffle.inspect
puts [1, 2, 3, 4].sort.inspect
puts [1, 2, 3, 4].min
puts [1, 2, 3, 4].max

array = [1, 2, 3, 4]
array.each do |element|
  puts 'x' * element
end
for element in array
  puts 'x' * element
end
#=> x
#=> xx
#=> xxx
#=> xxxx

array = %w[first second third fourth fifth sixth]
array.each do |e|
  puts e
end

[1, 2, 3, 4].reverse_each do |e|
  puts 'x' * e
end

[1, 2, 3, 4].each_with_index do |value, index|
  puts "#{index} -> #{'x' * value}"
end

puts([1, 2, 3, 4].map do|e|; e*2; end.inspect) # collect
puts([1, 2, 3, 4].map do|e| e*2 end.inspect) # collect
puts [1, 2, 3, 4].map{|e|e*2}.inspect # collect
puts ["fish", "and", "chips"].map{|e| e.upcase}.inspect
puts ["fish", "and", "chips"].map(&:upcase).inspect

puts [1, 2, 3, 4].select{|e|e.even?}.inspect # find_all, (select!, keep_if)

puts [1, 2, 3, 4].reject{|e| e.odd?}.inspect # (reject!, delete_if)

puts [1, 2, 3, 4].inject{|s,v| s += v} # reduce
puts [1, 2, 3, 4].inject(0){|s,v| s + v}
puts [1, 2, 3, 4].inject(:+)
puts [1, 2, 3, 4].inject(0, :+)
puts [1, 2, 3, 4].inject{|s,v| s *= v}
puts [1, 2, 3, 4].inject(1){|s,v| s * v}
[1,2,3].instance_eval { reduce(:+) / size.to_f }

puts [1, 1, 2, 3, 3, 4, 3].group_by{|e| e}.inspect
puts [1, 1, 2, 3, 3, 4, 3].chunk{|e| e}.map{|e| e}.inspect

puts [1, 2, 3, 4].include? 2
puts [1, 2, 3, 4].include?

puts [1, 2, 3, 4, 1, 2].uniq.inspect

array = [1, 2, 3, 4]
puts array.reverse.inspect
puts array.inspect

puts array.reverse!.inspect
puts array.inspect

puts 3.times{ puts "Hello" }

puts 1.upto(10).to_a.inspect

puts 10.downto(1).to_a.inspect

puts 10.step(1, -2).to_a.inspect
puts 1.step(10, 2).to_a.inspect
puts 10.step(by:-2,to:1).to_a.inspect

# Hash - http://ruby-doc.org/core-2.3.1/Hash.html
puts ({}).inspect
puts (Hash.new).inspect
puts ({:a => 1, :b => 2}).inspect
puts ({:a => 1, :b => 2}).inspect
puts ({a: 1, b: 2}).inspect

puts ({a: 1, b: 2}).keys.inspect
puts ({a: 1, b: 2}).values.inspect

require "json"
puts ({"a" => 1, "b" => 2}).to_json
puts JSON.pretty_generate({"a" => 1, "b" => 2})

require "awesome_print"
ap({"a" => 1, "b" => 2})

hash = {}
hash[:a] = 1
hash[:b] = 2
puts hash.inspect

puts hash.values.inspect
puts hash.keys.inspect

{"a" => 1, "b" => 2}.each do |key, value|
  puts "#{key} -> #{value}"
end

for key, value in {"a" => 1, "b" => 2}
  puts "#{key} -> #{value}"
end

{"a" => 1, "b" => 2}.each_value do |e|
  puts e
end

{a: 1, b: 2, c: 3}.select do |key, value|
  value.odd?
end

# Range
puts (1..4).inspect
puts Range.new(1, 4).inspect
puts (1..4).to_a.inspect
puts (1...4).to_a.inspect
puts (-5..-1).to_a.inspect
puts ('a'..'e').to_a.inspect
puts ('a'...'e').to_a.inspect

puts (1..10).step(2).to_a.inspect

puts (1..10).begin
puts (1..10).first
puts (1..10).end
puts (1..10).last

(1..10).each do |e|
  # puts "#{element.to_s.rjust(2, '0')} - #{'x' * element}"
  puts "#{"%02d" % element.to_s} - #{'x' * element}" # Kernel::sprintf
end
