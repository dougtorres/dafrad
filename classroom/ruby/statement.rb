# http://ruby-doc.org/core-2.3.1/doc/syntax/control_expressions_rdoc.html

if true then
  puts "the test resulted in a true-value"
end

if true
  puts "the test resulted in a true-value"
end

a = 1
if a.zero?
  puts "a is zero"
elsif a == 1
  puts "a is one"
else
  puts "a is some other value"
end

puts a.zero? ? "a is zero" : "a is one"

puts "foi" unless false
puts "foi" if not false

variable = "123456"
numbers = [1, 2, 3, 4, 5, 6]
case variable
when "12345"
  puts "the string is 12345"
when Fixnum
  puts "it is Fixnum"
when *numbers
  puts "include in array"
when /^1/
  puts "the string starts with one"
when /^1/, 2, "a"
  puts "the string starts with one, it is 2 or it is 'a'"
else
  puts "I don't know what the string starts with"
end

a = 0
a += 1 while a < 10
p a #=> prints 10

a = (1..10).to_enum
while true
  begin
    p a.next
  rescue StopIteration
    # p $!
    break
  end
end

a = 0
a += 1 until a > 10
p a #=> prints 11

a = (1..10).to_enum
until false
  begin
    a.next if a.peek.odd?
    p a.next
  rescue StopIteration
    # p $!
    break
  end
end

a = 0
until a > 10 do
  p a
  a += 1
end
p a

for value in [1, 2, 3] do
  puts value
end
