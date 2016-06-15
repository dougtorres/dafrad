class Calc

  def self.add(numbers)
    if numbers.empty?
      0
    else
      numbers = numbers.split(", ").map(&:to_i)
      numbers.inject(&:+)
    end
  end

end
