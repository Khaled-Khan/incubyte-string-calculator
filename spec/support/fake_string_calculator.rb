class StringCalculator
  def self.add(numbers)
    return 0 if numbers.empty?
    # numbers.split(/,|\n/).map(&:to_i).sum

    delimiter = /,|\n/  # default delimiters

    if numbers.start_with?("//")
      parts = numbers.split("\n", 2)
      custom_delimiter = parts[0][2..]
      delimiter = Regexp.escape(custom_delimiter)
      numbers = parts[1]
    end

    numbers.split(/#{delimiter}/).map(&:to_i).sum
  end
end

