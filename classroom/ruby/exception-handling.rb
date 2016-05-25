# Exception Handling

# rescue method
def do_something
  # ... do something ...
rescue
  # handle exception
end

# rescue begin...end block
begin
  # ...
rescue ArgumentError, NameError
  # handle ArgumentError or NameError
end

# rescue
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
else
  # this runs only when no exception was raised
ensure
  # this always runs
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
  puts $! # current exception
  puts $@ # exception’s backtrace
end
gt(10,20)
gt(100,20)
