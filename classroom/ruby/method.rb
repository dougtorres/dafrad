# http://ruby-doc.org/core-2.3.1/doc/syntax/calling_methods_rdoc.html
# http://ruby-doc.org/core-2.3.1/doc/syntax/methods_rdoc.html

def soma(a, b)
  a + b
end
puts soma(1, 2)
puts soma 1, 2
puts soma 1, soma(1, 1) # SyntaxError

# case sensitive
def SOMA(a, b)
  a + b
end
puts SOMA(1, 2)

# overriding
def soma(a)
  a
end
begin
  puts soma(1, 2)
rescue
  puts "essa chamada dispara um ArgumentError"
end
puts soma(1)

# Default Values
def soma(a, b=1)
  a + b
end
puts soma 1, 2
puts soma 1

# Array Decomposition
def soma((a, b))
  a + b
end
puts soma [1, 2] #=> 3
puts soma [1, 2, 3] #=> 3

def soma((a, *b))
  b = b.inject(:+) if b.is_a? Array
  a + b
end
puts soma([1, 2]) #=> 3
puts soma([1, 2, 3]) #=> 6

def soma(a, (b, c), d)
  [a, c, b, d].compact.inject(:+)
end
puts soma(1, [2, 3], 4) #=> 10
puts soma(1, 2, 4) #=> 7

# Keyword Arguments
def soma(a:1, b:1)
  a + b
end
puts soma b:3, a:1
puts soma :b => 3, :a => 1
puts soma(b:3)

def soma(a, b:1, c:1)
  a + b + c
end
puts soma 1, b:1, c:1
arguments = [1, {b: 1, c: 1}]
puts soma *arguments # Array to Arguments Conversion
arguments = {b: 1, c: 1}
puts soma 1, **arguments # Hash to Keyword Arguments Conversion

# Array/Hash Argument
def soma(*values)
  values.inject(:+)
end
puts soma(1, 2, 3, 4)

def soma(a:1, **b)
  a + b.values.inject(:+)
end
puts soma a:1, b:3
puts soma a:1, b:3, c:2

# Block
print_string = lambda { |string| puts string }
print_string.call('hello world')
print_string['hello world']

print_string = Proc.new { |string| puts string }
print_string['hello world']

print_string = proc { |string| puts string }
print_string['hello world']

print_string = ->(string) { puts string }
print_string['hello world']

def method_block_example
  yield
end
method_block_example { puts 'hello world' } # Block Argument

def method_block_example
  yield 'hello world'
end
method_block_example {|string| puts string }
method_block_example {|string| puts string * 2 }

def method_block_example
  yield 'hello world'
  yield 'lorem ipsum'
end
method_block_example {|string| puts string }

def method_block_example(&block)
  block.call 'hello world'
  # yield 'hello world'
end
method_block_example {|string| puts string}
