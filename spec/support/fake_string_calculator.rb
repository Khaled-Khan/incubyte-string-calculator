class StringCalculator
  def self.add(numbers)
    return 0 if numbers.empty?
    # numbers.split(/,|\n/).map(&:to_i).sum

    delimiters = [",", "\n", "|"]  # defaults

    if numbers.start_with?("//")
      header, numbers = numbers.split("\n", 2)

      if header.include?("[")
        # //[delim][delim2]... supports long & multiple delimiters
        custom = header.scan(/\[(.*?)\]/).flatten
        delimiters.concat(custom)
      else
        # //;  (single-char)
        delimiters << header[2]
      end
    end

    # IMPORTANT: don't double-escape; let Regexp.union escape strings safely
    split_pattern = Regexp.union(delimiters)

    parts = numbers.split(split_pattern)
    nums  = parts.map!(&:to_i)

    check_for_negatives(nums)

    nums.reject! { |n| n > 1000 } # ignore > 1000
    nums.sum
  end

  def self.check_for_negatives(nums)
    negatives = nums.select { |n| n < 0 }
    unless negatives.empty?
      raise "negatives not allowed: #{negatives.join(', ')}"
    end
  end
end

