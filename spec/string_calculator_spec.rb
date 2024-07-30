# spec/string_calculator_spec.rb
require "string_calculator"
#RSpec::Expectations.configuration.on_potential_false_positives = :nothing

describe StringCalculator do
  describe ".add" do
    context "given an empty string" do
      it "returns zero" do
        expect(StringCalculator.add("")).to eq(0)
      end
    end

    context "given '1'" do
      it "returns 1" do
        expect(StringCalculator.add("1")).to eql(1)
      end
    end

    context "given '10'" do
      it "returns 10" do
        expect(StringCalculator.add("10")).to eql(10)
      end
    end

    context "two numbers" do
      context "given '1,5'" do
        it "returns 6" do
          expect(StringCalculator.add("1,5")).to eql(6)
        end
      end

      context "given '17,100'" do
        it "returns 117" do
          expect(StringCalculator.add("17,100")).to eql(117)
        end
      end
    end

    context "given '1\n2,3'" do
        it "returns 6" do
          expect(StringCalculator.add("1\n2,3")).to eql(6)
        end
    end

    context "given '//;\n1;2'" do
        it "returns 3" do
          expect(StringCalculator.add("//;\n1;2")).to eql(3)
        end
    end
    context "given '//;\n1;-2;-8'" do
        it 'raises ArgumentError exception' do
          expect{ StringCalculator.add("//;\n1;-2;-8") }.to raise_error('negative numbers not allowed: -2,-8')
        end
    end
  end
end
