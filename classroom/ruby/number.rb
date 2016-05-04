# Fixnum
puts 1234.class
puts Fixnum.superclass
puts Fixnum.ancestors.inspect
puts ObjectSpace.each_object(Numeric.singleton_class).map{|c| c}[1..-2].inspect
puts 1234.object_id
puts 1234.object_id
puts 1235.object_id
puts 1234
puts 2_121_234
puts 0d170
puts 0xAa
puts 0252
puts 0o252
puts 0b10101010

# Float
puts (12.34).class
puts 12.34
puts 1234e-2
puts 1.234E1
puts 0.2-0.3 # IEEE 754

# Bignum
puts (2**62).class
puts (2**62).object_id
puts (2**62).object_id

# Rational
puts (1/2).class
puts Rational(1, 2)
puts 0.5.to_r

# Complex
puts 3+0i
puts Complex(3, 0)
puts 3.to_c
