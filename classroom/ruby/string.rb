# Single Quote
puts 'lorem ipsum dolor'.class
puts 'lorem ipsum dolor'
puts 'lorem\' ipsum dolor'
puts 'lorem\\ ipsum dolor'
puts 'lorem\nipsum dolor'

# Double Quote (interpolation & character escaping)
puts "lorem ipsum dolor".class
puts "lorem ipsum dolor"
puts "lorem\nipsum dolor"
puts "Hello #{1 + 1}"
puts "lorem ipsum
dolor"

# Symbol
puts :lorem.class
puts :lorem
puts :"lorem ipsum dolor"
puts :"lorem #{1 + 1}"

# Single character
puts ?a

# heredoc
  puts <<HEREDOC
lorem ipsum
dolor
HEREDOC

  puts <<-HEREDOC
lorem ipsum
dolor
  HEREDOC

  puts <<-HEREDOC
  1 + 1 is #{1 + 1}
  HEREDOC

  puts <<-'HEREDOC'
  1 + 1 is #{1 + 1}
  HEREDOC

  puts <<~HEREDOC
    lorem ipsum
      dolor
  HEREDOC

  puts <<-`HEREDOC`
  ls
  HEREDOC

# Percent Strings
puts %(lorem ipsum dolor)
puts %q(1 + 1 is 2)
puts %Q(1 + 1 is #{1 + 1})
puts %Q(1 + 1 is #{1 + 1}).inspect
puts %i(lorem ispum dolor).inspect
puts %r(lorem ispum dolor).inspect
puts %s(lorem ispum dolor).inspect
puts %w(lorem ispum dolor).inspect
puts %x(ls)
