# Exception Handling
def do_something
  # ... do something ...
rescue
  # handle exception
end

begin
  # ...
rescue ArgumentError, NameError
  # handle ArgumentError or NameError
end

begin
  # ...
rescue ArgumentError
  # handle ArgumentError
rescue NameError
  # handle NameError
rescue
  # handle any StandardError
end

begin
  # ...
rescue
  # ...
ensure
  # this always runs
end

begin
  # ...
rescue
  # ...
else
  # this runs only when no exception was raised
ensure
  # ...
end

def gt10(number)
  if number > 10
    true
  else
    raise Exception # http://ruby-doc.org/core-2.3.1/Exception.html
  end
rescue Exception => e
  warn e.message
end
gt10(11)
gt10(10)

class NotGreaterThanError < StandardError
end

def gt(result, number)
  raise NotGreaterThanError, "Not greater than error" if result > number
  true
rescue NotGreaterThanError => e
  warn e.message
end
gt(10,20)
gt(100,20)
