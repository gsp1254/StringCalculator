class StringCalculator
  def self.add(input_string)
    delimiters, numbers = extract_delimiters(input_string)
    numbers = numbers.split(/["#{delimiters}"]/)
    numbers = numbers.map{|e| e.to_i}
    negative_numbers = numbers.select{|e| e<0}
    if negative_numbers.size > 0
        raise "negative numbers not allowed: #{negative_numbers.join(",")}"
    else
        numbers.inject(0) { |sum, number| sum + number }
    end
  end

  def self.extract_delimiters(values)
      if values[0..1] == "//"
          delimiters, values = values.split("\n")
          return delimiters[2..-1].gsub("][", "]|[") + "|,|\n", values
      end
      return ',|\n', values
  end
end

# v = StringCalculator.add("1\n2,-3")
# p v