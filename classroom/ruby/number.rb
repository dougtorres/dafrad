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
# http://blog.plataformatec.com.br/2014/09/floating-point-and-currency/
# http://ruby-doc.org/stdlib-2.3.0/libdoc/bigdecimal/rdoc/BigDecimal.html
require 'bigdecimal'
require 'bigdecimal/util'
puts (BigDecimal("0.3") - 0.2).to_f
puts (0.3.to_d - 0.2.to_d).to_f
# http://mitrev.net/ruby/2015/08/28/benchmarking-ruby/
require "benchmark"
puts Benchmark.measure { BigDecimal("0.3") - 0.2 }
puts Benchmark.realtime { BigDecimal("0.3") - 0.2 }
Benchmark.bm do |x|
  x.report("bigdecimal") { BigDecimal("0.3") - 0.2 }
  x.report("float") { 0.3 - 0.2 }
end
require "benchmark/ips"
Benchmark.ips do |x|
  x.report("bigdecimal1") { BigDecimal("0.3") - 0.2 }
  x.report("bigdecimal2") { BigDecimal("0.3") - 0.2 }
  x.report("float") { 0.3 - 0.2 }
  x.compare!
end

# Bignum
puts (2**62).class
puts (2**62).object_id.to_s(32)
puts (2**62).object_id.to_s(32)

# Rational
puts (1/2).class
puts Rational(1, 2)
puts 0.5.to_r

# Complex
puts 3+0i
puts Complex(3, 0)
puts 3.to_c
