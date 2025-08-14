require "spec_helper"
require_relative "support/fake_string_calculator"

RSpec.describe StringCalculator do
  describe ".add" do
    it "returns 0 for empty string" do
      expect(StringCalculator.add("")).to eq(0)
    end

    it "returns the number itself when a single number is provided" do
      expect(StringCalculator.add("1")).to eq(1)
    end

    it "returns the sum of two comma-separated numbers" do
      expect(StringCalculator.add("1,2")).to eq(3)
    end

    it "returns the sum of an unknown amount of comma-separated numbers" do
      expect(StringCalculator.add("1,2,3,4,5")).to eq(15)
    end

    it "supports new lines between numbers" do
      expect(StringCalculator.add("1\n2,3")).to eq(6)
    end

    it "supports custom single-character delimiters" do
      expect(StringCalculator.add("//;\n1;2")).to eq(3)
    end

    it "raises an exception when negative numbers are passed" do
      expect { StringCalculator.add("1,-2,3,-4") }
        .to raise_error("negatives not allowed: -2, -4")
    end
  end
end

