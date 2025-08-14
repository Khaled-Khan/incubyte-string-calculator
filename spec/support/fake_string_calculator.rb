class StringCalculator
    def self.add(numbers)
      return 0 if numbers == ""
      nums = numbers.split(",").map(&:to_i)
      nums.sum
    end
  end
