require 'say'

module NumberInEnglish
  class << self
    def MINIMUM
      0
    end

    def MINIMUM_IN_ENGLISH
      'zero'
    end

    def MAXIMUM
      999_999_999_999
    end

    def MAXIMUM_IN_ENGLISH
      'nine hundred ninety-nine billion nine hundred ninety-nine million nine hundred ninety-nine thousand nine hundred ninety-nine'
    end

    def ones
      {
        0 => 'zero',
        1 => 'one',
        2 => 'two',
        3 => 'three',
        4 => 'four',
        5 => 'five',
        6 => 'six',
        7 => 'seven',
        8 => 'eight',
        9 => 'nine'
      }
    end

    def preteens
      {
        11 => 'eleven',
        12 => 'twelve'
      }
    end

    def teens
      {
        13 => 'thirteen',
        14 => 'fourteen',
        15 => 'fifteen',
        16 => 'sixteen',
        17 => 'seventeen',
        18 => 'eighteen',
        19 => 'nineteen'
      }
    end

    def tens
      {
        10 => 'ten',
        20 => 'twenty',
        30 => 'thirty',
        40 => 'forty',
        50 => 'fifty',
        60 => 'sixty',
        70 => 'seventy',
        80 => 'eighty',
        90 => 'ninety'
      }
    end

    def powers_of_ten
      {
        1 => 'one',
        10 => 'ten',
        100 => 'hundred',
        1_000 => 'thousand',
        1_000_000 => 'million',
        1_000_000_000 => 'billion'
      }
    end
  end
end

def number_to_english(value)
  rvalue = ""
  case
  when value >= 1_000_000_000
    billions = value / 1_000_000_000
    rvalue += "#{number_to_english(billions)}" + " #{NumberInEnglish.powers_of_ten[1_000_000_000]}"
    remainder = value % 1_000_000_000
    rvalue += " #{number_to_english(remainder)}" unless remainder.zero?
  when value >= 1_000_000
    millions = value / 1_000_000
    rvalue += "#{number_to_english(millions)}" + " #{NumberInEnglish.powers_of_ten[1_000_000]}"
    remainder = value % 1_000_000
    rvalue += " #{number_to_english(remainder)}" unless remainder.zero?
  when value >= 1_000
    thousands = value / 1_000
    rvalue += "#{number_to_english(thousands)}" + " #{NumberInEnglish.powers_of_ten[1_000]}"
    remainder = value % 1_000
    rvalue += " #{number_to_english(remainder)}" unless remainder.zero?
  when value >= 100
    hundreds = value / 100
    rvalue += "#{number_to_english(hundreds)}" + " #{NumberInEnglish.powers_of_ten[100]}"
    remainder = value % 100
    rvalue += " #{number_to_english(remainder)}" unless remainder.zero?
  when value >= 20
    tens = value / 10
    rvalue += "#{NumberInEnglish.tens[tens * 10]}"
    remainder = value % 10
    rvalue += "-#{number_to_english(remainder)}" unless remainder.zero?
  when value >= 13
    rvalue += "#{NumberInEnglish.teens[value]}"
  when value >= 11
    rvalue += "#{NumberInEnglish.preteens[value]}"
  when value == 10
    rvalue += "#{NumberInEnglish.tens[10]}"
  when value >= 1
    rvalue += "#{NumberInEnglish.ones[value]}"
  else
  end
  rvalue
end

def number_to_english_root(value)
  return 'zero' if value.zero?
  "#{number_to_english(value)}"
end

def context_number_match(number_hash)
  number_hash.each do |number_key, number_value_in_english|
    context("#{number_key}") { let(:number) { number_key }; it { expect(subject).to match(number_value_in_english) } }
  end
end

def context_number_equal(value)
  context("#{value}") { let(:number) { value }; it { expect(subject).to eq(number_to_english_root(value)) } }
end

RSpec.describe Say do
  let(:number) { double("number") }
  let(:say) { Say.new(number) }

  describe '#in_english' do
    subject { say.in_english }

    context 'boundary conditions' do
      context 'below minimum' do
        let(:number) { NumberInEnglish.MINIMUM-1 }
        it { expect { subject }.to raise_error(ArgumentError) }
      end
      context 'minimum' do
        let(:number) { NumberInEnglish.MINIMUM }
        it { expect { subject }.to_not raise_error }
        it { expect(subject).to eq(NumberInEnglish.MINIMUM_IN_ENGLISH) }
      end
      context 'maximum' do
        let(:number) { NumberInEnglish.MAXIMUM }
        it { expect { subject }.to_not raise_error }
        it { expect(subject).to eq(NumberInEnglish.MAXIMUM_IN_ENGLISH) }
      end
      context 'above maximum' do
        let(:number) { NumberInEnglish.MAXIMUM+1 }
        it { expect { subject }.to raise_error(ArgumentError) }
      end
    end

    context 'number match' do
      context_number_match(NumberInEnglish.ones)
      context_number_match(NumberInEnglish.preteens)
      context_number_match(NumberInEnglish.teens)
      context_number_match(NumberInEnglish.tens)
      context_number_match(NumberInEnglish.powers_of_ten)
    end

    context 'number equal' do
      MAXTIMES = 1_999
      NumberInEnglish.MINIMUM.upto(NumberInEnglish.MINIMUM+MAXTIMES) { |n| context_number_equal(n) }
      MAXTIMES.times { context_number_equal(rand(NumberInEnglish.MAXIMUM)) }
      NumberInEnglish.MAXIMUM.downto(NumberInEnglish.MAXIMUM-MAXTIMES) { |n| context_number_equal(n) }
    end
  end
end
