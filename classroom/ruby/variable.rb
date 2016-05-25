# http://ruby-doc.org/core-2.3.1/doc/syntax/assignment_rdoc.html

# local_variables (Kernel)
# puts local_variables.inspect
variable = "valor"
puts variable
snake_case = true
puts snake_case
number_variable = 0
puts number_variable

x
# p x #=> NameError
x = nil
p x
x ||= 1
p x
x ||= 10
p x

# global_variables (Kernel)
puts global_variables.inspect
$global_variable = 10
puts $global_variable
$GLOBAL_VARIABLE = 20
puts $GLOBAL_VARIABLE
# Pre-defined global variables
puts $LOAD_PATH
puts $FILENAME
# Pre-defined global constants
puts RUBY_VERSION
puts ENV.inspect

# constants (Module)
CONSTANT = 10
puts CONSTANT
# CONSTANT = 20 #=> warning: already initialized constant CONSTANT
puts CONSTANT

# Keywords
puts __FILE__
puts __LINE__
