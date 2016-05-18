# http://ruby-doc.org/core-2.3.1/doc/syntax/modules_and_classes_rdoc.html

# definindo uma classe
class Student
  def name
    @name
  end

  def name=(name)
    @name = name
  end
end

class Student
  attr_reader :id, :email
  attr_writer :email
  attr_accessor :name #=> attr_reader, attr_writer

  @course = "TSI"
  @@student_id = 0

  def initialize(name, email='')
    @name = name
    @email = email
    @id = Student.next_id
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
    "Nome: #{@name}, E-mail: #{@email}"
  end

  def inspect
    ivs = instance_variables.map{|b|
      "#{b}:#{self.instance_variable_get(b).inspect}"
    }.join(", ")
    "<#{self.class}:#{object_id()} #{ivs}>"
  end

  # private
  # protected

end

student = Student.new "sicrano"
student2 = Student.new "fulano"

# instance_variables
# puts student.course #=> NoMethodError
# puts student.@course #=> syntax error

puts student.id

puts student.name
student.name = "fulano"
puts student.name

student.email = "fulano@email"
puts student.email

puts student #=>
puts student.inspect #=>

# número de métodos
puts student.methods.size
puts Student.methods.size

# método de uma instância de objeto
def student.hello
  "Hello #{@name}"
end
puts student.hello
# puts student2.hello #=> NoMethodError

class Student
  def hello
    "Hello #{@name}!"
  end
end
puts student.hello
puts student2.hello

# class_variables
# puts student.student_id #=> NoMethodError
# puts Student.student_id #=> NoMethodError
puts Student.get_student_id
puts Student.get_student_id_s
puts Student.get_student_id_h.inspect

def Student.count_student
  @@student_id
end
# puts Student.count_student
# puts student.count_student #=> NoMethodError

# comparação
puts (student != student2).inspect

# methods (Object)
# private_methods (Object)
# protected_methods (Object)
# public_methods (Object)
# singleton_methods (Object)
# instance_methods (Module)
# private_instance_methods (Module)
# protected_instance_methods (Module)
# public_instance_methods (Module)

# namespace

# inheritance

# module
