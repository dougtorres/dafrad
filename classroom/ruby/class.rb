# http://ruby-doc.org/core-2.3.1/doc/syntax/modules_and_classes_rdoc.html
# global_variables (Kernel)
# local_variables (Kernel)
# class_variables (Module)
# constants (Module)
# methods (Object)
# private_methods (Object)
# protected_methods (Object)
# singleton_methods (Object)
# instance_methods (Module)
# class_methods (Module)
# public_methods (Object)
# private_instance_methods (Module)
# protected_instance_methods (Module)
# public_instance_methods (Module)
# finalize
  # https://gist.github.com/iboard/5648299
# Demonstrates behavior of private and protected methods in child classes in Ruby
  # https://gist.github.com/dwbutler/4554269

# class
class Student
  def name
    @name
  end

  def name=(name)
    @name = name
  end
end

puts Object.new.class
puts Student.new.class

class Student
  attr_reader :id, :email
  attr_writer :email
  attr_accessor :name, :course #=> attr_reader, attr_writer

  INSTITUITION = "IFPB"
  @@student_id = 0

  def initialize(name, email='', course="TSI")
    @name = name
    @email = email
    @id = Student.next_id
    @course = course
  end

  def self.next_id
    @@student_id.next
  end

  def Student.get_student_id
    @@student_id
  end

  class << self
    def get_student_id_s
      "id: #{@@student_id}"
    end

    def get_student_id_h
      {id: @@student_id}
    end
  end

  def to_s
    "Id:#{@id}, Nome: #{@name}, E-mail: #{@email},"+
    " Couse: #{@course}, Inst: #{INSTITUITION}"
  end

  alias :to_string :to_s

  def inspect
    ivs = instance_variables.map{|b|
      "#{b}:#{self.instance_variable_get(b).inspect}"
    }.join(", ")
    "<#{self.class}:#{object_id()} #{ivs}>"
  end

  def call_private_good
    private_test
  end

  def call_private_bad
    self.private_test # NoMethodError
  end

  # private
  def private_test
    'private'
  end
  private :private_test

  protected
  def protected_test
    'protected'
  end
  # protected :protected_test
end

sicrano = Student.new "sicrano"
fulano = Student.new "fulano"

# puts Student.new("beltrano").private_test #=> NoMethodError
# puts Student.new("beltrano").protected_test #=> NoMethodError
puts Student.new("beltrano").call_private_good
# puts Student.new("beltrano").call_private_bad

# instance_variables (Object)
puts sicrano.instance_variables.inspect

# puts sicrano.course #=> NoMethodError
# puts sicrano.@course #=> syntax error

puts sicrano.id

puts sicrano.name
sicrano.name = "fulano"
puts sicrano.name

sicrano.email = "fulano@email"
puts sicrano.email

puts sicrano.course

puts sicrano #=>
puts sicrano.to_string #=>
puts sicrano.inspect #=>

# número de métodos
puts sicrano.methods.size
puts Student.methods.size

# singleton_methods
def sicrano.hello
  "Hello #{@name}"
end
puts sicrano.hello
puts sicrano.singleton_methods.inspect
# puts fulano.hello #=> NoMethodError
puts fulano.singleton_methods.inspect

class Student
  def hello
    "Hello #{@name}!"
  end

  def Student.hello
    "Hello #{@name}!"
  end
end
puts sicrano.hello
puts fulano.hello
puts Student.hello

# class_methods (Module)
# puts sicrano.student_id #=> NoMethodError
# puts Student.student_id #=> NoMethodError
puts Student.get_student_id
puts Student.get_student_id_s
puts Student.get_student_id_h.inspect

class Student
  # def Student.count_student
  #   @@student_id
  # end

  # def self.count_student
  #   @@student_id
  # end

  def count_student
    @@student_id
  end
end

def Student.count_student
  @@student_id
end

puts Student.count_student
puts sicrano.count_student

# class constants
puts Student::INSTITUITION
# puts Student.INSTITUITION #=> NoMethodError
# puts sicrano.INSTITUITION #=> NoMethodError
class Student
  def self.instituition
    INSTITUITION
  end

  def instituition
    INSTITUITION
  end
end
puts Student.instituition #=>"IFPB"
puts sicrano.instituition #=>"IFPB"

# comparation
puts (sicrano != fulano).inspect

# inheritance
class Undergraduate < Student
  attr_accessor :grade

  def initialize(name, email='', course="TSI")
    super(name, email, course)
    @grade = 0
  end

  # overriding
  def inspect
    ivs = instance_variables.map{|b|
      "#{b}:#{self.instance_variable_get(b).inspect}"
    }.join("\n\t")
    "<\n\t#{self.class}:#{object_id()}\n\t#{ivs}\n>"
  end

  def call_protected_good
    protected_test
  end
end

fulano = Undergraduate.new("Fulano", "fulano@email", "TSI")
puts fulano.name
puts fulano.grade
puts fulano.inspect

# puts Undergraduate.new("beltrano").protected_test #=> NoMethodError
puts Undergraduate.new("beltrano").call_protected_good

puts Undergraduate.superclass
puts Undergraduate.ancestors.to_a.inspect

puts fulano.is_a?(Undergraduate)
puts fulano.is_a?(Student)

puts fulano.kind_of?(Undergraduate)
puts fulano.kind_of?(Student)

puts fulano.instance_of?(Undergraduate)
puts fulano.instance_of?(Student)

# module

# open class

# namespace
