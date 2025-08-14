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

    nums = numbers.split(/#{delimiter}/).map(&:to_i)

    check_for_negatives(nums)
    nums.sum
  end

  def self.check_for_negatives(nums)
    negatives = nums.select { |n| n < 0 }
    unless negatives.empty?
      raise "negatives not allowed: #{negatives.join(', ')}"
    end
  end
end

