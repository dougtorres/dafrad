# http://ruby-doc.org/core-2.3.1/doc/syntax/calling_methods_rdoc.html
# http://ruby-doc.org/core-2.3.1/doc/syntax/methods_rdoc.html

def soma(a, b)
  a + b
end
puts soma(1, 2)
puts soma 1, 2

def soma(a)
  a
end
# puts soma(1, 2) # essa chamada dispara um ArgumentError
puts soma(1)

# Default Values
def soma(a, b=1)
  a + b
end
puts soma 1, 2
puts soma 1

# Array Decomposition
def soma((a, b))
  a+b
end
puts soma [1,2]

# Keyword Arguments
def soma(a:1, b:1)
  a + b
end
puts soma b:3, a:1
puts soma :b => 3, :a => 1
puts soma(b:3)

# Array/Hash Argument
def soma(*values)
  values.inject(:+)
end
puts soma(1, 2, 3, 4)
